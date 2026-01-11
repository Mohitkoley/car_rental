import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final String asset;
  final Color color;

  const BrandLogo({super.key, required this.asset, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(Icons.directions_car, color: color),
    );
  }
}
