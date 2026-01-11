import 'package:car/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common_extension/common_extension.dart';
import 'package:car/models/car.dart';
import 'package:car/widgets/car/spec_card.dart';
import 'package:car/navigation/route_names.dart';
import 'package:car/widgets/common/common_image.dart';

class CarDetailScreen extends StatelessWidget {
  final CarModel car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: context.h * 0.45,
            child: CommonImage(imageUrl: car.imageUrl, fit: BoxFit.cover),
          ),

          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black26),
                ),
                
              ],
            ),
          ),

          Positioned(
            top: context.h * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                24,
                24,
                24,
                100,
              ), // Bottom padding for footer
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.brand,
                              style: context.headlineMedium.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              car.model,
                              style: context.titleLarge.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${car.pricePerDay}',
                              style: context.headlineMedium.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColor,
                              ),
                            ),
                            Text(
                              '/day',
                              style: context.bodyMedium.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Specifications',
                      style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SpecCard(
                            title: 'Speed',
                            value: car
                                .topSpeed, // Fixed: used topSpeed instead of maxSpeed
                            icon: Icons.speed,
                          ),
                          const SizedBox(width: 16),
                          SpecCard(
                            title: 'Gearbox',
                            value: car.transmission,
                            icon: Icons.settings,
                          ),
                          const SizedBox(width: 16),
                          SpecCard(
                            title: 'Fuel',
                            value: car.fuelType,
                            icon: Icons.local_gas_station,
                          ),
                          const SizedBox(width: 16),
                          SpecCard(
                            title: 'Seats',
                            value: '${car.seats} Seats',
                            icon: Icons.event_seat,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Description',
                      style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Experience the ultimate driving pleasure with this ${car.brand} ${car.model}. '
                      'Perfect for both business trips and weekend getaways. '
                      'Features include premium sound system, leather seats, and advanced navigation.',
                      style: context.bodyLarge.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2B34),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '\$${car.pricePerDay.toStringAsFixed(0)}',
                        style: context.headlineSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/day',
                        style: context.bodyMedium.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: car.isAvailable ? () {
                      context.push(RouteNames.bookingForm, extra: car);
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: car.isAvailable ? const Color(0xFFFFF8E1) : Colors.grey[300],
                      foregroundColor: car.isAvailable ? Colors.black : Colors.grey[600],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      car.isAvailable ? 'Book Now' : 'Unavailable',
                      style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color:  !car.isAvailable ? ColorPalette.buttonPrimary : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
