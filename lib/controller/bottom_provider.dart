import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentSelectedIndex = 0;
  void changeBottom(int index) {
    currentSelectedIndex = index;
    notifyListeners();
  }
}
