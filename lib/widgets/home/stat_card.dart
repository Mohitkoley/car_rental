import 'package:car/theme/color_palette.dart';
import 'package:common_extension/context_extension/context_ext.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key,required this.icon,
    required this. value,
    required this. label,
    required this. color,});

    final String value;
    final String label;
    final Color color;
    final IconData icon;
  

  @override
  Widget build(BuildContext context) {
   return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: context.labelSmall.copyWith(
              color: ColorPalette.iconSecondary,
            ),
          ),
        ],
      ),
    );
  }
}