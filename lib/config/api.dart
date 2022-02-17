import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todobooks/config/storage_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiHandler {
  factory ApiHandler() => _instance;
  static final ApiHandler _instance = ApiHandler._internal();
  ApiHandler._internal() {
    debugPrint("Color Map Class Created");
  }

  Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  final String? _endpoint = dotenv.env['API_ENDPOINT'];

  Future<Map<String, String>> get headers async {
    String? token = await PrefsManager.readData('token');
    print(token);
    if (token != null) {
      return {...baseHeaders, 'Authorization': 'JWT $token'};
    } else {
      return baseHeaders;
    }
  }

  Future<Map<String, dynamic>> get(String url) async {
    debugPrint('get() url: $url');

    http.Response resp = await http.get(
      Uri.parse('$_endpoint$url'),
      headers: await headers,
    );

    if (resp.statusCode == 200) {
      return json.decode(resp.body);
    } else {
      throw Exception(resp.body.toString());
    }
  }

  Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> payload,
  ) async {
    debugPrint('post() url: $url');

    http.Response resp = await http.post(
      Uri.parse('$_endpoint$url'),
      body: json.encode(payload),
      headers: await headers,
    );
    if (resp.statusCode == 200) {
      return json.decode(resp.body);
    } else {
      throw Exception(resp.body.toString());
    }
  }
}
