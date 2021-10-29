import 'package:flutter/material.dart';

import 'exercise_item.dart';

//入力値が変更を反映させるChangeNotifierを設定させる
class ExerciseManager extends ChangeNotifier {
  final _exerciseItems = <ExerciseItem>[];
  List<ExerciseItem> get exerciseItems => List.unmodifiable(_exerciseItems);

  void deleteItem(int index) {
    _exerciseItems.removeAt(index);
    notifyListeners();
  }

  void addItem(ExerciseItem item) {
    _exerciseItems.add(item);
    notifyListeners();
  }

  void updateItem(ExerciseItem item, int index) {
    _exerciseItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _exerciseItems[index];
    _exerciseItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
