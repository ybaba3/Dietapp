import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import 'empty_exercise_screen.dart';

//exercise_body_screen.dartを呼び出してFloatingActionButtonを加えた画面を作ります
class Exercise extends StatelessWidget {
  const Exercise({Key? key}) : super(key: key);

  String? get exerciseItems => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /*final manager = Provider.of<ExerciseManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },
                onUpdate: (item) {},
              ),
            ),
          );*/
        },
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Consumer<ExerciseManager>(
      builder: (context, manager, child) {
        if (manager.exerciseItems.isEmpty) {
          return Container();
        } else {
          return const EmptyExerciseScreen();
        }
      },
    );
  }
}
