import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common_extension/common_extension.dart';
import 'package:car/models/car.dart';
import 'package:car/providers/booking_provider.dart';
import 'package:car/widgets/booking/summary_row.dart';
import 'package:car/navigation/route_names.dart';
import 'package:car/utils/date_formatter.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final CarModel car;
  final DateTime startDate;
  final DateTime endDate;
  final String userName;
  final String location;

  const BookingConfirmationScreen({
    super.key,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.userName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final days = endDate.difference(startDate).inDays + 1;
    final totalCost = days * car.pricePerDay;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 24),
              Text(
                'Booking Confirmed!',
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'You have successfully booked the ${car.brand} ${car.model}.',
                textAlign: TextAlign.center,
                style: context.bodyLarge,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SummaryRow(
                      label: 'Name:',
                      value: userName,
                    ),
                    const SizedBox(height: 8),
                    SummaryRow(
                      label: 'Location:',
                      value: location,
                    ),
                    const SizedBox(height: 8),
                    SummaryRow(
                      label: 'Start Date:',
                      value: DateFormatter.formatMediumDate(startDate),
                    ),
                    const SizedBox(height: 8),
                    SummaryRow(
                      label: 'End Date:',
                      value: DateFormatter.formatMediumDate(endDate),
                    ),
                    const Divider(height: 24),
                    SummaryRow(
                      label: 'Total Cost:',
                      value: '\$${totalCost.toStringAsFixed(2)}',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final BookingModel booking = BookingModel(
                      carId: car.id,
                      startDate: startDate,
                      endDate: endDate,
                      userName: userName,
                      location: location,
                    );
                    context.go(RouteNames.home);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) {
                        context.push(
                          RouteNames.bookingDetails,
                          extra: {
                            'booking': booking,
                            'car': car,
                          },
                        );
                      }
                    });
                  },
                  child: const Text('Show Details'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    context.go(RouteNames.home);
                  },
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
