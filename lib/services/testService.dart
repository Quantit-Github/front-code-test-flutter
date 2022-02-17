import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todobooks/config/storage_manager.dart';
import 'package:todobooks/views/home.dart';

class TestService {
  String uri = "https://317a-59-6-230-229.ngrok.io";

  Future<void> login(String email, String password) async {
    try {
      var url = Uri.parse("$uri/api/token");
      var response =
          await http.post(url, body: {"username": email, "password": password});
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        PrefsManager.saveData("token", res["access"]);

        Get.to(() => HomePage());
      }
    } catch (e) {
      print(e);
    }
  }
}
