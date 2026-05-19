import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key, required this.onClick, required this.str, required this.color, required this.height});

  final Function onClick;
  final String str;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(onPressed: ()=>onClick(str), child: Text(str), style: ElevatedButton.styleFrom(backgroundColor: color),),
    );
  }
}