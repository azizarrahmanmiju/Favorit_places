import 'dart:io';

import 'package:uuid/uuid.dart';

class Place {
  Place({required this.title, required this.image, required this.description})
      : id = const Uuid().v4();

  final String id;
  final String title;
  final File? image;
  final String description;
}
