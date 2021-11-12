import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dietapp_pages.dart';
import '../models/models.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage<SplashScreen> page() {
    return MaterialPage<SplashScreen>(
      name: DietappPages.splashPath,
      key: ValueKey(DietappPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/rw_logo.png'),
            ),
            Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
