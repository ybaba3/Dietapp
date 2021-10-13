import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../data/user_dao.dart';
import 'ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
      ],
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primaryColor: const Color(0xFF3D814A),
        ),
        home: Consumer<UserDao>(builder: (context, userDao, child) {
          return const Login();
        }),
      ),
    );
  }
}
