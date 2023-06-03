import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_nikah_booking/data/models/get_user.dart';

class GetUserRepository {
  static String mainUrl = "http://192.168.1.9:5000";
  final Dio _dio = Dio();
  var getUserURL = '$mainUrl/me';

  Future<GetUser> fetchUserData() async {
    Response response = await _dio.get(getUserURL);
    return GetUser.fromJson(response.data);
  }
}

class NetworkError extends Error {}
