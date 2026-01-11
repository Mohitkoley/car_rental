import 'package:car/navigation/route_names.dart';
import 'package:car/providers/car_provider.dart';
import 'package:car/widgets/common/common_image.dart';
import 'package:car/constants/image_const.dart';
import 'package:car/theme/color_palette.dart';
import 'package:car/widgets/home/home_car_card.dart';
import 'package:car/widgets/home/stat_card.dart';
import 'package:common_extension/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cars = ref.watch(carProvider);
    final availableCars = cars.where((car) => car.isAvailable).toList();

   final double featuredCarHeight = 240;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Car Rental",
                    style: context.headlineMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Find your perfect ride",
                    style: context.bodyMedium.copyWith(
                      color: ColorPalette.iconSecondary,
                    ),
                  ),
                ],
              ),
              const CommonImage(
                imageUrl: ImageConst.userProfile,
                width: 50,
                height: 50,
                radius: 25,
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: StatCard(
             
                  icon: Icons.directions_car,
                  value: '${cars.length}',
                  label: 'Total Cars',
                  color: ColorPalette.info,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                
                  icon: Icons.check_circle,
                  value: '${availableCars.length}',
                  label: 'Available',
                  color: ColorPalette.success,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
           
                  icon: Icons.star,
                  value: '4.8',
                  label: 'Rating',
                  color: ColorPalette.warning,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Stack(
            children: [
              CommonImage(
                imageUrl: ref.read(carProvider).first.imageUrl,
                height: 240,
                width: double.infinity,
                radius: 24,
              ),
              Container(
                height: featuredCarHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      ColorPalette.overlay,
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPalette.featuredBadge.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'FEATURED',
                        style: context.labelSmall.copyWith(
                          color: ColorPalette.textOnPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Taste the Classy with our New',
                      style: context.labelLarge.copyWith(
                        color: ColorPalette.textOnPrimary.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ferrari 458 GTB',
                      style: context.headlineSmall.copyWith(
                        color: ColorPalette.textOnPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${ref.read(carProvider).first.pricePerDay}/day',
                      style: context.titleMedium.copyWith(
                        color: ColorPalette.textOnPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.push(
                          RouteNames.carDetails,
                          extra: ref.read(carProvider).first,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.buttonPrimary,
                        foregroundColor: ColorPalette.buttonSecondary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('View Details'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Cars',
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push(RouteNames.carList);
                },
                child: Text(
                  'See All',
                  style: context.labelLarge.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: availableCars.length > 4 ? 4 : availableCars.length,
            itemBuilder: (context, index) {
              final car = availableCars[index];
              return HomeCarCard(car: car);
            },
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                context.push(RouteNames.carList);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('View All Cars'),
            ),
          ),
        ],
      ),
    );
  }

  

 

}