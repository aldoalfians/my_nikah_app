import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/models/get_booking.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/models/booking_detail.dart';

class BookingRepository {
  static String mainUrl = "http://10.0.2.2:5000";
  final Dio _dio = Dio();
  var postBookingNow = '$mainUrl/booking';
  var getBookingList = '$mainUrl/booking';

  Future<dynamic> bookingNow(
      String hours, String date, int price, String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');

    Response response = await _dio.post(postBookingNow,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!,
          },
        ),
        data: {
          "hours": hours,
          "date": date,
          "price": price,
          "role": role
        }).timeout(const Duration(seconds: 3));
    return response.data;
  }

  Future<GetBooking> fetchBookingListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');

    Response response = await _dio.get(getBookingList,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!,
          },
        ));

    print(response.data);
    return GetBooking.fromJson(response.data);
  }

  Future<BookingDetail> fetchBookingDetail(String uuid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');
    Response response = await _dio.get('$getBookingList/$uuid',
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!,
          },
        ));

    print(response.data);
    return BookingDetail.fromJson(response.data);
  }
}
