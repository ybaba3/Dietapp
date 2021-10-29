//食事記録を入力するために変数を設定する
enum Mealtype {
  Breakfast,
  Lunch,
  Dinner,
}

class FoodItem {
  final String id;
  final String food;
  final Mealtype mealtype;
  final int quantity;
  final DateTime date;
  final bool isComplete;

  FoodItem({
    required this.id,
    required this.food,
    required this.mealtype,
    required this.quantity,
    required this.date,
    this.isComplete = false,
  });

  FoodItem copyWith({
    String? id,
    String? food,
    Mealtype? mealtype,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return FoodItem(
        id: id ?? this.id,
        food: food ?? this.food,
        mealtype: mealtype ?? this.mealtype,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
