import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_nikah_booking/data/models/login_user.dart';

class UserRepository {
  static String mainUrl = "http://192.168.1.9:5000";
  var loginUrl = '$mainUrl/login';
  var registUrl = '$mainUrl/regist';
  var logoutUr = '$mainUrl/logout';

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
    await _dio.delete(logoutUr);
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

  Future<LoginUser> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });

    return LoginUser.fromJson(response.data);
  }

  // Future<dynamic> logout() async {
  //   Response response = await _dio.delete(logoutUr);
  //   return response.data;
  // }
}
