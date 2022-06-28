import 'package:flutter/material.dart';
import 'package:todobooks/config/api.dart';
import 'package:todobooks/config/storage_manager.dart';
import 'package:todobooks/container/login/panel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void checkAutoLoginValidity(BuildContext context) async {
    String refresh = await PrefsManager.readData("refresh");
    String access = await PrefsManager.readData("access");

    //
    // Map<String, dynamic> payload = {
    //   "token": refresh,
    // };
    //
    // ApiHandler handler = ApiHandler();
    // Map<String, dynamic> res = await handler.post("/api/token/verify", payload);
    //
  }

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
