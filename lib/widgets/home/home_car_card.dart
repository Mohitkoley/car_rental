import 'package:car/models/car.dart';
import 'package:car/navigation/route_names.dart';
import 'package:car/theme/color_palette.dart';
import 'package:car/widgets/common/common_image.dart';
import 'package:common_extension/context_extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCarCard extends StatelessWidget {
  const HomeCarCard({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteNames.carDetails, extra: car);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.cardBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.cardShadow,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: CommonImage(
                imageUrl: car.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.brand,
                    style: context.labelMedium.copyWith(
                      color: ColorPalette.iconSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    car.model,
                    style: context.titleSmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${car.pricePerDay}',
                        style: context.titleMedium.copyWith(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/day',
                        style: context.labelSmall.copyWith(
                          color: ColorPalette.iconSecondary,
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