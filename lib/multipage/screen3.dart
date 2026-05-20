import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 3"),),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.navigate_next),),
      body: Center(
        child: TextField(decoration: InputDecoration(),),
      ),
    );
  }
}