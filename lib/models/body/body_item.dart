//体重の記録を入力するために変数を設定する
class BodyItem {
  final int weight;
  final DateTime date;
  final bool isComplete;

  BodyItem({
    required this.weight,
    required this.date,
    this.isComplete = false,
  });

  BodyItem copyWith({
    int? weight,
    DateTime? date,
    bool? isComplete,
  }) {
    return BodyItem(
        weight: weight ?? this.weight,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
