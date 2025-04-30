import 'package:flutter/material.dart';
import 'package:io_app/component/profile_item.dart';
import 'package:io_app/theme/io_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with background and profile image
        Stack(
          clipBehavior: Clip.none, // Allow overflow
          alignment: Alignment.center,
          children: [
            // First container with gradient background
            Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [IOColors.primary500, IOColors.primary400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Second container with rounded edges and opacity
            Positioned(
              top: 160, // Position the second container to overlap
              left: 20,
              right: 20,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // White with opacity
                  borderRadius: BorderRadius.circular(16), // Rounded edges
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "David Smith",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                   
                  ],
                ),
              ),
            ),

            // Profile picture
            Positioned(
              top: 120, // Position the profile picture above the second container
              child: CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage('assets/images/profile_user.jpg'),
                backgroundColor: Colors.white, // Optional: Add a white border
              ),
            ),
          ],
        ),

        const SizedBox(height: 120), // Adjust spacing for the second container

        // Options
        ProfileItem(icon: Icon(Icons.settings), text: "Settings"),
        ProfileItem(icon: Icon(Icons.people), text: "Team info"),
        ProfileItem(icon: Icon(Icons.emoji_events), text: "Rank"),
        ProfileItem(icon: Icon(Icons.delete), text: "Delete Account"),
      ],
    );
  }
}
