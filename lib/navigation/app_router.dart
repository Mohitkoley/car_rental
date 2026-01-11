import 'dart:convert';
import 'package:go_router/go_router.dart';

import 'package:car/navigation/route_names.dart';
import 'package:car/screens/splash/splash_screen.dart';
import 'package:car/screens/auth/welcome_screen.dart';
import 'package:car/screens/auth/login_screen.dart';
import 'package:car/screens/home/home_screen.dart';
import 'package:car/screens/car/car_detail_screen.dart';
import 'package:car/screens/booking/booking_form_screen.dart';
import 'package:car/screens/booking/booking_confirmation_screen.dart';
import 'package:car/screens/booking/booking_details_screen.dart';
import 'package:car/models/car.dart';
import 'package:car/providers/booking_provider.dart';

import 'package:car/screens/car/car_list_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteNames.splash,
    extraCodec: const MyExtraCodec(),
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.welcome,
        name: RouteNames.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.carList,
        name: RouteNames.carList,
        builder: (context, state) => const CarListScreen(),
      ),
      GoRoute(
        path: RouteNames.carDetails,
        name: RouteNames.carDetails,
        builder: (context, state) {
          final car = state.extra as CarModel;
          return CarDetailScreen(car: car);
        },
      ),
      GoRoute(
        path: RouteNames.bookingForm,
        name: RouteNames.bookingForm,
        builder: (context, state) {
          final car = state.extra as CarModel;
          return BookingFormScreen(car: car);
        },
      ),
      GoRoute(
        path: RouteNames.bookingConfirmation,
        name: RouteNames.bookingConfirmation,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final car = extras['car'] as CarModel;
          final startDate = extras['startDate'] as DateTime;
          final endDate = extras['endDate'] as DateTime;
          final userName = extras['userName'] as String;
          final location = extras['location'] as String;
          return BookingConfirmationScreen(
            car: car,
            startDate: startDate,
            endDate: endDate,
            userName: userName,
            location: location,
          );
        },
      ),
      GoRoute(
        path: RouteNames.bookingDetails,
        name: RouteNames.bookingDetails,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final booking = extras['booking'] as BookingModel;
          final car = extras['car'] as CarModel;
          return BookingDetailsScreen(
            booking: booking,
            car: car,
          );
        },
      ),
    ],
  );
}

class MyExtraCodec extends Codec<Object?, Object?> {
  const MyExtraCodec();
  @override
  Converter<Object?, Object?> get decoder => const _MyExtraDecoder();
  @override
  Converter<Object?, Object?> get encoder => const _MyExtraEncoder();
}

class _MyExtraEncoder extends Converter<Object?, Object?> {
  const _MyExtraEncoder();
  @override
  Object? convert(Object? input) {
    if (input == null) return null;
    if (input is CarModel) {
      return {'type': 'CarModel', 'data': input.toJson()};
    }
    if (input is BookingModel) {
      return {'type': 'BookingModel', 'data': input.toJson()};
    }
    if (input is DateTime) {
      return {'type': 'DateTime', 'data': input.toIso8601String()};
    }
    if (input is Map<String, dynamic>) {
      return input.map((k, v) => MapEntry(k, convert(v)));
    }
    return input;
  }
}

class _MyExtraDecoder extends Converter<Object?, Object?> {
  const _MyExtraDecoder();
  @override
  Object? convert(Object? input) {
    if (input == null) return null;
    if (input is Map<String, dynamic>) {
      if (input['type'] == 'CarModel') {
        return CarModel.fromJson(Map<String, dynamic>.from(input['data']));
      }
      if (input['type'] == 'BookingModel') {
        return BookingModel.fromJson(Map<String, dynamic>.from(input['data']));
      }
      if (input['type'] == 'DateTime') {
        return DateTime.parse(input['data']);
      }
      return input.map((k, v) => MapEntry(k, convert(v)));
    }
    return input;
  }
}
