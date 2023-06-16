import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/models/booking_detail.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/repositories/booking_repository.dart';

part 'detail_booking_event.dart';
part 'detail_booking_state.dart';

class DetailBookingBloc extends Bloc<DetailBookingEvent, DetailBookingState> {
  DetailBookingBloc() : super(DetailBookingInitial()) {
    final BookingRepository bookingRepository = BookingRepository();
    on<DetailBookingPressed>((event, emit) async {
      emit(DetailBookingLoading());
      try {
        final bookingDetail =
            await bookingRepository.fetchBookingDetail(event.uuid);
        emit(DetailBookingCompleted(bookingDetail));
      } catch (e) {
        emit(DetailBookiingFailure(error: e.toString()));
      }
    });
  }
}
