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
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Allow overflow for overlapping containers
        children: [
          // First container: Gradient with PUBG logo
          Positioned(
            top: 0, // Ensure it starts at the top
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/pubg_bands.png'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  colors: [IOColors.primary500, IOColors.primary400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Second container: Background white container
          Positioned(
            top: 200, // Start slightly below the first container
            left: 0,
            right: 0,
            bottom: 0, // Extend to the bottom of the screen
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6), // Solid white background
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ), // Rounded edges at the top
              ),
            ),
          ),

          // Third container: Profile section overlapping both containers
          Positioned(
            top: 150, // Positioned at the border of the first and second containers
            left: MediaQuery.of(context).size.width / 2 - 50, // Center horizontally
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                      backgroundImage: const AssetImage('assets/images/profile_user.jpg'),
                        child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                          color: Colors.white,
                          width: 2,
                          ),
                        ),
                        ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: IOColors.primary500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "David Smith",
                  style: TextStyle(
                    color:  IOColors.primary500,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Menu items inside the second container
          Positioned(
            top: 300, // Position below the profile section
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ProfileItem(icon: Icon(Icons.settings), text: "Settings"),
                  ProfileItem(icon: Icon(Icons.people), text: "Team info"),
                  ProfileItem(icon: Icon(Icons.emoji_events), text: "Rank"),
                  ProfileItem(icon: Icon(Icons.delete), text: "Delete Account"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
