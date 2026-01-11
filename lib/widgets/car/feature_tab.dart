import 'package:flutter/material.dart';
import 'package:common_extension/common_extension.dart';

class FeatureTab extends StatelessWidget {
  final String title;
  final bool isActive;

  const FeatureTab({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: context.labelLarge.copyWith(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
