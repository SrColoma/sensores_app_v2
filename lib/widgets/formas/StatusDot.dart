import 'package:flutter/material.dart';

class StatusDot extends StatelessWidget {
  final Color color;
  const StatusDot(
    this.color,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}