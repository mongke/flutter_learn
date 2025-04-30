import 'package:flutter/material.dart';

class IOButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final dynamic color;
  final dynamic textColor;

  const IOButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color=Colors.grey,
    this.textColor=Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}