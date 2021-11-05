import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        firstName: 'Ichiro',
        lastName: 'Tanuki',
        role: 'Dangoya',
        profileImageUrl: 'imanges/ti.JPG',
        darkMode: _darkMode,
      );

  bool get didSelectUser => _didSelectUser;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
