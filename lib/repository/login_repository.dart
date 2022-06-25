import 'package:flutter/foundation.dart';
import 'package:todobooks/config/api.dart';

import '../model/user.dart';

abstract class LoginRepository {
  Future<User> login({required String userName, required String password});
}

class LoginRepositoryImpl extends LoginRepository {
  late ApiHandler api;

  LoginRepositoryImpl() {
    api = ApiHandler();
  }
  @override
  Future<User> login(
      {required String userName, required String password}) async {
    try {
      final response = await api
          .post("/api/token", {"username": userName, "password": password});
      return User(
          userName: userName,
          accessToken: response["access"],
          refreshToken: response["refresh"]);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
