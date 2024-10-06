import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({required this.onpickimage});

  final void Function(File image) onpickimage;

  @override
  State<StatefulWidget> createState() {
    return _PickImage();
  }
}

class _PickImage extends State<PickImage> {
  File? selectedimage;
  void loadimage() async {
    final ImagePicker imagePicker = ImagePicker();
    final PickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (PickedImage == null) {
      return;
    }
    setState(() {
      selectedimage = File(PickedImage.path);
    });
    widget.onpickimage(selectedimage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: TextButton.icon(
        icon: const Icon(Icons.camera),
        onPressed: () {
          loadimage();
        },
        label: const Text('Select Image'),
      ),
    );

    if (selectedimage != null) {
      content = InkWell(
        onTap: () {
          loadimage();
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Image.file(
            selectedimage!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      );
    }

    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 212, 212, 212),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: content,
        ));
  }
}
