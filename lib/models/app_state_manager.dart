import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietappTab {
  static const int food = 0;
  static const int body = 1;
  static const int exercise = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = DietappTab.food;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;
    initializeApp();
    notifyListeners();
  }
}
