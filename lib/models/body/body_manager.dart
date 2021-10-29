import 'package:flutter/material.dart';

import 'body_item.dart';

//入力値が変更を反映させるChangeNotifierを設定させる
class BodyManager extends ChangeNotifier {
  final _bodyItems = <BodyItem>[];
  List<BodyItem> get bodyItems => List.unmodifiable(_bodyItems);

  void deleteItem(int index) {
    _bodyItems.removeAt(index);
    notifyListeners();
  }

  void addItem(BodyItem item) {
    _bodyItems.add(item);
    notifyListeners();
  }

  void updateItem(BodyItem item, int index) {
    _bodyItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _bodyItems[index];
    _bodyItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
