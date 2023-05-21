import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  static String mainUrl = "http://10.0.2.2:5000";
  var loginUrl = '$mainUrl/login';
  var registUrl = '$mainUrl/regist';

  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: "token");

    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persisteToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: "token");
    storage.deleteAll();
  }

  Future<dynamic> regist(String email, String name, String nik, String password,
      String confirmPassword) async {
    Response response = await _dio.post(registUrl, data: {
      "email": email,
      "name": name,
      "nik": nik,
      "password": password,
      "confirmPassword": confirmPassword,
      "role": "user"
    });

    return response.data;
  }

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });

    return response.data["uuid"];
  }
}
