part of 'detail_booking_bloc.dart';

abstract class DetailBookingEvent extends Equatable {
  const DetailBookingEvent();

  @override
  List<Object> get props => [];
}

class DetailBookingPressed extends DetailBookingEvent {
  final String uuid;
  const DetailBookingPressed({required this.uuid});

  @override
  List<Object> get props => [uuid];
}
