import 'package:flutter/material.dart';

class IoPlaceTile extends StatelessWidget {
  final bool purple;
  final String place;
  final String points;

  const IoPlaceTile({
    super.key,
    required this.place,
    required this.points,
    this.purple = false,
  });
  // Constructor for the IoPlaceTile widget
  // Takes in three parameters: purple (bool), place (String), and points (String)  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 30,
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: purple ? Colors.deepPurple.shade400 : Colors.grey.shade800,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              place,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerRight,
            child: Text(
              points,
              style: TextStyle(
                color: purple ? Colors.deepOrange : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
