import 'package:dietapp4/models/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dietapp_pages.dart';

class LoginScreen extends StatelessWidget {
  static MaterialPage<LoginScreen> page() {
    return MaterialPage<LoginScreen>(
      name: DietappPages.loginPath,
      key: ValueKey(DietappPages.loginPath),
      child: const LoginScreen(),
    );
  }

  final String? username;

  const LoginScreen({
    Key? key,
    this.username,
  }) : super(key: key);

  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage(
                    'images/ti.JPG',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              buildTextfield(username ?? '🍔 username'),
              const SizedBox(height: 16),
              buildTextfield('🎹 password'),
              const SizedBox(height: 16),
              buildloginButton(context),
              const SizedBox(height: 16),
              buildanonymousButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildanonymousButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Anonymous Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          Provider.of<AppStateManager>(context, listen: false)
              .login('mockUsername', 'modkPassword');
        },
      ),
    );
  }

  Widget buildloginButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          Provider.of<AppStateManager>(context, listen: false)
              .login('mockUsername', 'modkPassword');
        },
      ),
    );
  }

  Widget buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
