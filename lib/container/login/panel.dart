import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/config/storage_manager.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double horizontalPadding = 12.5;
  double verticalPadding = 218.5;

  void attemptLogin() {
    final String email = emailController.text;
    final String password = passwordController.text;
    // print(email);
    // print(password);

    // Unsure about the logging in feature right now.
    PrefsManager.saveData("refresh",
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1NjQ4NDU5MywiaWF0IjoxNjU2Mzk4MTkzLCJqdGkiOiI3YjIyMWI3ZDFiYzc0MmVhOWQ0MDk0Mzg2MmNkOGFjYSIsInVzZXJfaWQiOjF9.1ik02lVSiuPtFDN6s8YKOy26C9j0yk3FT0w685kxUrQ");
    PrefsManager.saveData("token",
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU2NDA4OTkzLCJpYXQiOjE2NTYzOTgxOTMsImp0aSI6ImY5OTAzZmI1OGVhYzQzYzNhYTBiMmVhOTdlNjYyNmE1IiwidXNlcl9pZCI6MX0.KbWlooeyRf9h_ZhOPGWaYFwtJ8H8PKQ8ZFc9ygqADik");

    Navigator.of(context).pushReplacementNamed(RouteEnum.main.path);
  }

  @override
  Widget build(BuildContext context) {
    // TODO login panel 구현
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login"),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Email"),
            autocorrect: false,
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
            autocorrect: false,
          ),
          TextButton(
            onPressed: attemptLogin,
            child: const Text("Login"),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(1, 206, 206, 206)),
            ),
          ),
          Row(
            // Instead can use RichText iirc
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Don't have an account? "),
              Text("Sign Up"),
            ],
          ),
          const Divider(
            thickness: 1,
            indent: 20,
          ),
        ],
      ),
    );
  }
}
