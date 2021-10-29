import 'package:flutter/material.dart';

//exercise_screen.dartに表示するための背景画面を作成します
class EmptyExerciseScreen extends StatelessWidget {
  const EmptyExerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(
        width: 350,
        height: 450,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/graph3.JPG'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
