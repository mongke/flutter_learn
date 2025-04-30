import 'package:flutter/material.dart';

class IoTitleItem extends StatelessWidget {
  final String text;

  const IoTitleItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
