import 'package:flutter/material.dart';

class IOInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const IOInput({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.white,
          filled: true,
          errorStyle: const TextStyle(
            color: Colors.white, // Red error message color
            fontSize: 14, // Font size for error message
            fontWeight: FontWeight.bold, // Bold error message
          ),
          border: OutlineInputBorder(),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear(); // Clear the text
                  },
                )
              : null,
        ),
        validator: validator,
        onChanged: (value) {
          // Trigger a rebuild to show/hide the clear button
          (context as Element).markNeedsBuild();
        },
      ),
    );
  }
}