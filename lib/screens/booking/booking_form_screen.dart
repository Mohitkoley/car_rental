import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:common_extension/common_extension.dart';
import 'package:car/models/car.dart';
import 'package:car/providers/booking_provider.dart';
import 'package:car/navigation/route_names.dart';
import 'package:car/utils/validator_mixin.dart';
import 'package:car/utils/date_formatter.dart';
import 'package:car/widgets/common/custom_text_field.dart';

class BookingFormScreen extends ConsumerStatefulWidget {
  final CarModel car;

  const BookingFormScreen({super.key, required this.car});

  @override
  ConsumerState<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends ConsumerState<BookingFormScreen>
    with ValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      if (_startDate == null || _endDate == null) {
        context.showSnack('Please select both start and end dates');
        return;
      }
      if (_endDate!.isBefore(_startDate!)) {
        context.showSnack('End date cannot be before start date');
        return;
      }

      final booking = BookingModel(
        carId: widget.car.id,
        startDate: _startDate!,
        endDate: _endDate!,
        userName: _nameController.text,
        location: _locationController.text,
      );

      ref.read(bookingProvider.notifier).addBooking(booking);

      context.push(
        RouteNames.bookingConfirmation,
        extra: {
          'car': widget.car,
          'startDate': _startDate!,
          'endDate': _endDate!,
          'userName': _nameController.text,
          'location': _locationController.text,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Your Ride'),
        backgroundColor: context.theme.colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking Details for ${widget.car.brand} ${widget.car.model}',
                style: context.titleLarge,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _nameController,
                hintText: 'Full Name',
                prefixIcon: const Icon(Icons.person),
                validator: (value) => isEmpty('Full Name', value),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _locationController,
                hintText: 'Pickup Location',
                prefixIcon: const Icon(Icons.location_on),
                validator: (value) => isEmpty('Location', value),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, true),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Start Date',
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        child: Text(
                          _startDate == null
                              ? 'Select Date'
                              : DateFormatter.formatMediumDate(_startDate!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, false),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'End Date',
                          prefixIcon: Icon(Icons.event_busy),
                        ),
                        child: Text(
                          _endDate == null
                              ? 'Select Date'
                              : DateFormatter.formatMediumDate(_endDate!),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: _submitBooking,
                  child: const Text('Confirm Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
