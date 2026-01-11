import 'package:flutter_riverpod/flutter_riverpod.dart';


class BookingModel {
  final String carId;
  final DateTime startDate;
  final DateTime endDate;
  final String userName;
  final String location;

  BookingModel({
    required this.carId,
    required this.startDate,
    required this.endDate,
    required this.userName,
    required this.location,
  });


  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      carId: json['carId'] as String,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      userName: json['userName'] as String,
      location: json['location'] as String,
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'userName': userName,
      'location': location,
    };
  }
}


class BookingNotifier extends Notifier<List<BookingModel>> {
  @override
  List<BookingModel> build() {
    return [];
  }

  void addBooking(BookingModel booking) {
    state = [...state, booking];
  }
}

final bookingProvider = NotifierProvider<BookingNotifier, List<BookingModel>>(
  () => BookingNotifier(),
);
