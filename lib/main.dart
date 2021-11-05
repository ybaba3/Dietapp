import 'package:dietapp4/models/profile_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dietapp_theme.dart';
import 'models/models.dart';
import 'navigation/app_rounter.dart';

//アプリを起動します
void main() {
  runApp(const Dietapp());
}

class Dietapp extends StatefulWidget {
  const Dietapp({Key? key}) : super(key: key);

  @override
  _DietappState createState() => _DietappState();
}

class _DietappState extends State<Dietapp> {
  final _appStateManager = AppStateManager();
  final _profileManager = ProfileManager();
  final _bodyManager = BodyManager();
  final _foodManager = FoodManager();
  final _exerciseManager = ExerciseManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      profileManager: _profileManager,
      bodyManager: _bodyManager,
      foodManager: _foodManager,
      exerciseManager: _exerciseManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _bodyManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _foodManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _exerciseManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = DietappTheme.dark();
          } else {
            theme = DietappTheme.light();
          }
          return MaterialApp(
            theme: theme,
            title: 'Dietapp',
            home: Router<void>(
              routerDelegate: _appRouter,
            ),
          );
        },
      ),
    );
  }
}
