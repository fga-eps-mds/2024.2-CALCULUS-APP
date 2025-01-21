import 'package:aranduapp/core/state/command.dart';
import 'package:flutter/material.dart';

class NavbarViewModel extends ChangeNotifier {
  late Command0<void> navbarCommand;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
