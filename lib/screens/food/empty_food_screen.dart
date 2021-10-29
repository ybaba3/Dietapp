import 'package:flutter/material.dart';

//food_screen.dartに表示するための背景画面を作成します
class Emptyscreen extends StatelessWidget {
  const Emptyscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('images/graph1.JPG'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
