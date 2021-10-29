import 'package:flutter/material.dart';

//Tab切り替えのためのindexを設定する
class TabManager extends ChangeNotifier {
  int selectedTab = 0;

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }
}
