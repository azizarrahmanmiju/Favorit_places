import 'dart:io';

import 'package:fav_place/Provider/addplace_provider.dart';
import 'package:fav_place/Widget/Pick_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Addplace extends ConsumerStatefulWidget {
  const Addplace({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _Addplace();
  }
}

class _Addplace extends ConsumerState<Addplace> {
  TextEditingController controller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  File? _selectedimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 50,
        right: 10,
        bottom: 10,
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 251, 251),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(
              width: 2, color: const Color.fromARGB(255, 226, 224, 224)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    maxLength: 16,
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Place Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 30,
                    controller: descriptioncontroller,
                    decoration: const InputDecoration(
                      labelText: 'Place  Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PickImage(
                    onpickimage: (image) {
                      _selectedimage = image;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: Addplace, child: const Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Addplace() {
    if (controller.text.isEmpty ||
        _selectedimage == null ||
        descriptioncontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields')),
      );
      return;
    } else {
      final title = controller.text;
      ref
          .watch(addPlaceNotifierProvider.notifier)
          .addplace(title, _selectedimage!, descriptioncontroller.text);
      Navigator.pop(context);
    }
  }
}
