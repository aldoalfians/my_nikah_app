part of 'detail_booking_bloc.dart';

abstract class DetailBookingState extends Equatable {
  const DetailBookingState();

  @override
  List<Object> get props => [];
}

class DetailBookingInitial extends DetailBookingState {}

class DetailBookingLoading extends DetailBookingState {}

class DetailBookingCompleted extends DetailBookingState {
  final BookingDetail bookingDetail;

  const DetailBookingCompleted(this.bookingDetail);

  @override
  List<Object> get props => [bookingDetail];
}

class DetailBookiingFailure extends DetailBookingState {
  final String error;

  const DetailBookiingFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "BookingFailure";
}
