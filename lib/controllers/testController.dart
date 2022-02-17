import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todobooks/services/testService.dart';

class TestController extends GetxController {
  final FocusNode emailNode = new FocusNode();
  final TextEditingController email = new TextEditingController();
  final FocusNode passNode = new FocusNode();
  final TextEditingController password = new TextEditingController();

  Future<void> login() async {
    try {
      TestService().login(email.text, password.text);
    } catch (e) {
      print(e);
    }
  }
}
