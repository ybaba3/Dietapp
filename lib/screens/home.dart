import 'package:dietapp4/models/dietapp_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import 'body/body_screen.dart';
import 'exercise/exercise_screen.dart';
import 'food/food_screen.dart';

//Food、Body、Exerciseの３つの画面と画面下部のNavigationを作ります
class Home extends StatefulWidget {
  static MaterialPage<void> page(int currnetTab) {
    return MaterialPage<void>(
      name: DietappPages.home,
      key: ValueKey(DietappPages.home),
      child: Home(
        currentTab: currnetTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    const Food(),
    const Body(),
    const Exercise(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Dietapp',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              profileButton(),
            ],
          ),
          body: IndexedStack(index: widget.currentTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant),
                label: 'Meal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                label: 'Body',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Exercise',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'images/ti.JPG',
          ),
        ),
        onTap: () {
          // TODO: home -> profile
        },
      ),
    );
  }
}
