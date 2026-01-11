import 'package:car/models/car.dart';
import 'package:car/navigation/route_names.dart';
import 'package:car/widgets/common/common_image.dart';
import 'package:common_extension/context_extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarCard extends StatelessWidget {
  const CarCard(BuildContext context, {super.key, required this.car});
  final  CarModel car;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        context.push(RouteNames.carDetails, extra: car);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImage(
              imageUrl: car.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              radius: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.brand,
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    car.model,
                    style: context.bodyMedium.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$${car.pricePerDay}',
                            style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '/day',
                            style: context.bodyMedium.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: car.isAvailable ? Colors.black : Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          car.isAvailable ? 'Book' : 'Unavailable',
                          style: context.labelLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}