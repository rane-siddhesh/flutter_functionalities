import 'package:flutter/material.dart';
import 'package:layout_builder/multipage/screen3.dart';

class Screen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3(),));
      }, child: Icon(Icons.navigate_next),),
      body: Center(
        child: TextField(decoration: InputDecoration(),),
      ),
    );
  }
}