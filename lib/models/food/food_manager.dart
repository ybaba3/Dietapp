import 'package:flutter/material.dart';

import 'food_item.dart';

//入力値が変更を反映させるChangeNotifierを設定させる
class FoodManager extends ChangeNotifier {
  final _foodItems = <FoodItem>[];

  List<FoodItem> get foodItems => List.unmodifiable(_foodItems);

  void deleteItem(int index) {
    _foodItems.removeAt(index);
    notifyListeners();
  }

  void addItem(FoodItem item) {
    _foodItems.add(item);
    notifyListeners();
  }

  void updateItem(FoodItem item, int index) {
    _foodItems[index] = item;
    notifyListeners();
  }

  void completedItem(int index, bool change) {
    final item = _foodItems[index];
    _foodItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
