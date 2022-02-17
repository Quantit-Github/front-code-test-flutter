import 'package:flutter/material.dart';
import 'package:todobooks/container/login/panel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const LoginPanel(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
