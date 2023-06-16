import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_nikah_booking/screens/main/screens/article/models/get_articles.dart';

class ArticleRepository {
  static String mainUrl = "http://10.0.2.2:5000";
  final Dio _dio = Dio();
  var article = '$mainUrl/article';

  Future<GetArticles> fetchArticleListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');

    Response response = await _dio.get(article,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!,
          },
        ));

    print(response.data);
    return GetArticles.fromJson(response.data);
  }
}
