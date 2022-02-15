import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';

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

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text(
            "Login",
            style: TextStyle(
              color: ColorMap().primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
