import 'package:flutter/material.dart';

class IoTitleItem extends StatelessWidget {
  final String text;
  final bool hasIcon;
  final Widget? widget;

  const IoTitleItem({super.key, required this.text, this.hasIcon=false, this.widget});

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
          hasIcon
              ? Icon(Icons.arrow_right)
              : (widget != null) ? widget! : SizedBox.shrink(),
        ],
      ),
    );
  }
}
