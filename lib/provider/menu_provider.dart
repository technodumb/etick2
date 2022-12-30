import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  bool _isMenuOpened = false;
  bool get isMenuOpened => _isMenuOpened;

  void toggleMenu() {
    _isMenuOpened = !_isMenuOpened;
    notifyListeners();
  }

  bool _isProfileOpened = false;
  bool get isProfileOpened => _isProfileOpened;

  void toggleProfile() {
    _isProfileOpened = !_isProfileOpened;
    notifyListeners();
  }

  int _currentMenuOption = 1;
  int get currentMenuOption => _currentMenuOption;

  void setCurrentMenuOption(int option) {
    _currentMenuOption = option;
    notifyListeners();
  }
}
