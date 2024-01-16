import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProvider extends ChangeNotifier {
  final startingPoint = TextEditingController();
  final destinationPoint = TextEditingController();
  final budget = TextEditingController();
  final startingDate = TextEditingController();
  final endingDate = TextEditingController();

  File? selectedimage;

  fromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedimage = File(returnedimage!.path);
    notifyListeners();
  }
}
