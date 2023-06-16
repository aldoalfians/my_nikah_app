part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingCompeleted extends BookingState {
  final String success;

  const BookingCompeleted({required this.success});

  @override
  List<Object> get props => [success];

  @override
  String toString() => "Booking Berhasil";
}

class BookingListCompleted extends BookingState {
  final GetBooking getBooking;

  const BookingListCompleted(this.getBooking);

  @override
  List<Object> get props => [getBooking];
}

// class BookingDetailCompleted extends BookingState {
//   final BookingDetail bookingDetail;

//   const BookingDetailCompleted(this.bookingDetail);

//   @override
//   List<Object> get props => [bookingDetail];
// }

class BookingFailure extends BookingState {
  final String error;

  const BookingFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "BookingFailure";
}
