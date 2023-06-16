import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/repositories/booking_repository.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/models/get_booking.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/models/booking_detail.dart';
import 'dart:async';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    final BookingRepository bookingRepository = BookingRepository();
    on<BookingButtonPressed>((event, emit) async {
      var timer = Timer(Duration(seconds: 3), () => emit(BookingLoading()));
      try {
        emit(BookingLoading());
        await Future.delayed(Duration(seconds: 3));
        final booking = await bookingRepository.bookingNow(
            event.hours, event.date, event.price, event.role);
        emit(BookingCompeleted(success: booking.toString()));
      } catch (e) {
        emit(BookingFailure(error: e.toString()));
      }
      timer.cancel();
    });

    on<BookingListStarted>(((event, emit) async {
      try {
        emit(BookingLoading());
        final bookingDetail = await bookingRepository.fetchBookingListData();
        emit(BookingListCompleted(bookingDetail));
      } catch (e) {
        emit(BookingFailure(error: e.toString()));
      }
    }));

    // on<BookingDetailPressed>(((event, emit) async {
    //   try {
    //     emit(BookingLoading());
    //     final bookingDetail =
    //         await bookingRepository.fetchBookingDetail(event.uuid);
    //     emit(BookingDetailCompleted(bookingDetail));
    //   } catch (e) {
    //     emit(BookingFailure(error: e.toString()));
    //   }
    // }));
  }
}
