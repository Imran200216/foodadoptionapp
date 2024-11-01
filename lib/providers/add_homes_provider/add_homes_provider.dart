import 'package:flutter/material.dart';

class AddHomesProvider extends ChangeNotifier {
  String? _selectedValue; // Make it nullable

  // Getter for selectedValue
  String? get selectedValue => _selectedValue;

  void setSelectedValue(String newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }
}
