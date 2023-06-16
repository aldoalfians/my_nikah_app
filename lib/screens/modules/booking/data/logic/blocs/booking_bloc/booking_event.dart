part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class BookingButtonPressed extends BookingEvent {
  final String hours;
  final String date;
  final int price;
  final String role;

  const BookingButtonPressed({
    required this.hours,
    required this.date,
    required this.price,
    required this.role,
  });

  @override
  List<Object> get props => [date, price, role];

  @override
  String toString() =>
      'BookingButtonPressed {hours: $hours, date: $date, price: $price, role: $role}';
}

class BookingListStarted extends BookingEvent {}

class BookingDetailPressed extends BookingEvent {
  final String uuid;
  const BookingDetailPressed({required this.uuid});

  @override
  List<Object> get props => [uuid];
}
