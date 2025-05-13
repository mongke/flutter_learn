import 'package:flutter/material.dart';
import 'package:io_app/component/io_notification_card.dart';
import 'package:io_app/theme/io_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          IoNotificationCard(
            typeLabel: "team_invite_accept",
            emailMessage:
                "B170910019@must.edu.mn таны багийн урилгыг зөвшөөрлөө",
            date: "2025/03/24",
            time: "11:03",
            trailingIcon: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 16,
            ), // optional
          ),
          IoNotificationCard(
            typeLabel: 'Match Results',
            emailMessage: 'Your match results are ready to view.',
            date: '2023/10/01',
            time: '14:30',
            trailingIcon: Icon(Icons.check_circle, color: IOColors.primary500),
          ),
          IoNotificationCard(
            typeLabel: 'New Message',
            emailMessage: 'You have a new message from your friend.',
            date: '2023/10/02',
            time: '09:15',
            trailingIcon: Icon(Icons.message, color: IOColors.primary500),
          ),
          IoNotificationCard(
            typeLabel: 'System Update',
            emailMessage: 'A new system update is available.',
            date: '2023/10/03',
            time: '12:00',
            trailingIcon: Icon(Icons.system_update, color: IOColors.primary500),
          ),
          IoNotificationCard(
            typeLabel: 'Event Reminder',
            emailMessage: 'Don\'t forget about the upcoming event.',
            date: '2023/10/04',
            time: '08:00',
            trailingIcon: Icon(Icons.event, color: IOColors.primary500),
          ),
          IoNotificationCard(
            typeLabel: 'Friend Request',
            emailMessage: 'You have a new friend request.',
            date: '2023/10/05',
            time: '15:45',
            trailingIcon: Icon(Icons.person_add, color: IOColors.primary500),
          ),
        ],
      ),
    );
  }
}
