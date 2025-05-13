import 'package:flutter/material.dart';
import 'package:io_app/theme/io_colors.dart';

class IoNotificationCard extends StatelessWidget {
  final String typeLabel;
  final String emailMessage;
  final String date;
  final String time;
  final Widget? trailingIcon;

  const IoNotificationCard({
    super.key,
    required this.typeLabel,
    required this.emailMessage,
    required this.date,
    required this.time,
    this.trailingIcon,
  });


  Widget _chip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with label + icon + indicator
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: IOColors.primary500,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(typeLabel,
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    SizedBox(width: 8),
                    Image(
                      image: AssetImage('assets/images/logo_1.png'),
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: IOColors.primary500,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(emailMessage, style: TextStyle(fontSize: 14)),
          SizedBox(height: 12),
          Row(
            children: [
              _chip('$date $time'),
            ],
          ),
        ],
      ),
    );
  }
}