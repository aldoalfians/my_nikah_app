import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_nikah_booking/data/models/get_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserRepository {
  static String mainUrl = "http://10.0.2.2:5000";
  final Dio _dio = Dio();
  var getUserURL = '$mainUrl/me';

  Future<GetUser> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');

    Response response = await _dio.get(getUserURL,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        }));
    return GetUser.fromJson(response.data);
  }
}

class NetworkError extends Error {}
