import 'package:flutter/material.dart';
import 'package:common_extension/common_extension.dart';

class SpecIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const SpecIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          label,
          style: context.labelSmall.copyWith(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
