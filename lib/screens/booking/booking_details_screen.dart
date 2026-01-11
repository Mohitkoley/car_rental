import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common_extension/common_extension.dart';
import 'package:car/models/car.dart';
import 'package:car/providers/booking_provider.dart';
import 'package:car/widgets/booking/summary_row.dart';
import 'package:car/widgets/common/common_image.dart';
import 'package:car/utils/date_formatter.dart';

class BookingDetailsScreen extends StatelessWidget {
  final BookingModel booking;
  final CarModel car;

  const BookingDetailsScreen({
    super.key,
    required this.booking,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    final days = booking.endDate.difference(booking.startDate).inDays + 1;
    final totalCost = days * car.pricePerDay;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Booking Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImage(
              imageUrl: car.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.brand,
                              style: context.headlineSmall.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              car.model,
                              style: context.titleMedium.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Confirmed',
                          style: context.labelLarge.copyWith(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Booking Information',
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SummaryRow(
                          label: 'Customer Name',
                          value: booking.userName,
                        ),
                        const SizedBox(height: 16),
                        SummaryRow(
                          label: 'Pickup Location',
                          value: booking.location,
                        ),
                        const SizedBox(height: 16),
                        SummaryRow(
                          label: 'Start Date',
                          value: DateFormatter.formatLongDate(booking.startDate),
                        ),
                        const SizedBox(height: 16),
                        SummaryRow(
                          label: 'End Date',
                          value: DateFormatter.formatLongDate(booking.endDate),
                        ),
                        const SizedBox(height: 16),
                        SummaryRow(
                          label: 'Duration',
                          value: DateFormatter.formatDuration(booking.startDate, booking.endDate),
                        ),
                        const Divider(height: 32),
                        SummaryRow(
                          label: 'Price per day',
                          value: '\$${car.pricePerDay.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 16),
                        SummaryRow(
                          label: 'Total Cost',
                          value: '\$${totalCost.toStringAsFixed(2)}',
                          isTotal: true,
                        ),
                      ],
                    ),
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
