import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  const CustomContainer({super.key, required this.onClick, required this.child, required this.color,});

  final Function onClick;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick("Custom"),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: color, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15.0)),
        child: child,
      ),
    );
  }
}