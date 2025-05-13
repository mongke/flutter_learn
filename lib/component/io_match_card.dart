import 'package:flutter/material.dart';
import 'package:io_app/theme/io_colors.dart';

class IoMatchCard extends StatelessWidget {
  final String matchData;
  final Color? colorName;
  final VoidCallback? onTap;
  const IoMatchCard({super.key, required this.matchData, this.colorName = IOColors.primary500, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: matchData.length * 12.0,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colorName,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                matchData,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
