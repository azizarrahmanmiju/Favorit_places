import 'dart:io';

import 'package:fav_place/Model/Place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddplaceNotifier extends StateNotifier<List<Place>> {
  AddplaceNotifier() : super([]);

  void addplace(String title, File image, String description) {
    final newPlace =
        Place(title: title, image: image, description: description);
    state = [newPlace, ...state];
  }
}

final addPlaceNotifierProvider =
    StateNotifierProvider<AddplaceNotifier, List<Place>>(
        (ref) => AddplaceNotifier());
