import 'package:flutter/material.dart';
import 'package:io_app/theme/io_colors.dart';

class ProfileItem extends StatelessWidget {
  final Widget icon;
  final String text;
  const ProfileItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: IOColors.primary500,width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: IconTheme(
            data: IconThemeData(color: IOColors.primary500),
            child: icon,
          ),
        ),
        SizedBox(width: 20,),
        Text(text, style: TextStyle(fontSize: 18)),
        Spacer(),
        Icon(Icons.arrow_right)
      ],),
    );
  }
}