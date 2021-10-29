import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dietapp_theme.dart';
import 'home.dart';
import 'models/models.dart';

//アプリを起動します
void main() {
  runApp(const Dietapp());
}

class Dietapp extends StatelessWidget {
  const Dietapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DietappTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Dietapp',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => FoodManager()),
          ChangeNotifierProvider(create: (context) => BodyManager()),
          ChangeNotifierProvider(create: (context) => ExerciseManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
