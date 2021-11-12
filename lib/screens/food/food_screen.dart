import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import 'empty_food_screen.dart';

//food_body_screen.dartを呼び出してFloatingActionButtonを加えた画面を作ります
class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /*final manager = Provider.of<FoodManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodItemScreen(
                  onCreate: (item) {
                    manager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {}),
            ),
          );*/
        },
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Consumer<FoodManager>(
      builder: (context, manager, child) {
        if (manager.foodItems.isNotEmpty) {
          return Container();
        } else {
          return const Emptyscreen();
        }
      },
    );
  }
}
