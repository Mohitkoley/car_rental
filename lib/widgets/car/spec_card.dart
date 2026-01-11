import 'package:flutter/material.dart';
import 'package:common_extension/common_extension.dart';

class SpecCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SpecCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.grey[800]),
          const SizedBox(height: 8),
          Text(value, style: context.labelLarge.copyWith(fontWeight: FontWeight.bold)),
          Text(
            title,
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
