import 'package:fav_place/Provider/addplace_provider.dart';
import 'package:fav_place/Screen/addplace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Placelist extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place List'),
        backgroundColor: const Color.fromARGB(213, 240, 240, 240),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Addplace()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: _body(context, ref),
    );
  }

  Widget _body(context, ref) {
    final places = ref.watch(addPlaceNotifierProvider);

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Card(
                  child: ListTile(
                    title: Text(
                      places[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      places[index].description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        (places[index].image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
