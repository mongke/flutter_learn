import 'package:flutter/material.dart';

class IoDropDown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> values;
  final String bottomSheetTitle;
  final ValueChanged<String> onChanged;

  const IoDropDown({
    super.key,
    required this.label,
    required this.value,
    required this.values,
    required this.bottomSheetTitle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBottomSheet(context),
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value, style: TextStyle(fontSize: 16)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ), // Rounded top corners
    ),
    builder: (_) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title with Close Icon
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(), // Push the title to the center
                    Text(
                      bottomSheetTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(), // Push the close icon to the right
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Grid of buttons
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                    crossAxisSpacing: 12, // Space between columns
                    mainAxisSpacing: 12, // Space between rows
                    childAspectRatio: 3, // Button aspect ratio
                  ),
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    final item = values[index];
                    final isSelected = item == value;
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (item != value) onChanged(item);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.purple // Primary button color for selected
                            : Colors.grey[300], // Secondary button color for unselected
                        foregroundColor: isSelected
                            ? Colors.white // Text color for selected
                            : Colors.black, // Text color for unselected
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Slightly rounded corners
                        ),
                      ),
                      child: Text(item, style: const TextStyle(fontSize: 14)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
