//運動の記録を入力するために変数を設定する
class ExerciseItem {
  final String exercise;
  final DateTime date;
  final bool isComplete;

  ExerciseItem({
    required this.exercise,
    required this.date,
    this.isComplete = false,
  });

  ExerciseItem copyWith({
    String? exercise,
    DateTime? date,
    bool? isComplete,
  }) {
    return ExerciseItem(
        exercise: exercise ?? this.exercise,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
