import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/car.dart';
import '../data/mock_data.dart';

final carProvider = Provider<List<CarModel>>((ref) {
  return mockCars;
});
