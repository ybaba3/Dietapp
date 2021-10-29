import 'package:dietapp4/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'body_item_screen.dart';
import 'empty_body_screen.dart';

//empty_body_screen.dartを呼び出してFloatingActionButtonを加えた画面を作ります
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<BodyManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BodyItemScreen(
                  onCreate: (item) {
                    manager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {}),
            ),
          );
        },
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Consumer<BodyManager>(
      builder: (context, manager, child) {
        if (manager.bodyItems.isNotEmpty) {
          return Container();
        } else {
          return const EmptyBodyScreen();
        }
      },
    );
  }
}
