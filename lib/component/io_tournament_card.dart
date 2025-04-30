import 'package:flutter/material.dart';

class IoTournamentCard extends StatelessWidget {
  final String statusText;
  final String imagePath;
  final String titleText;

  const IoTournamentCard({
    super.key,
    required this.statusText,
    required this.imagePath,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow content to overflow outside the container
      children: [
        Container(
          width: 150,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24), // Add space for the badge
              // Tournament image
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath, // Use the imagePath parameter
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                titleText, // Use the titleText parameter
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        // Status badge centered horizontally on the border of the container
        Positioned(
          top: -10, // Position the badge on the border
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusText, // Use the statusText parameter
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
