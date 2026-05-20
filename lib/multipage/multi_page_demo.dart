import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout_builder/multipage/screen2.dart';

class MultiPageDemo extends StatelessWidget{
  const MultiPageDemo({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        /*Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(),));*/
        context.push("/multi_page/screen2");
      }, child: Icon(Icons.navigate_next),),
      body: Center(
        child: TextField(decoration: InputDecoration(),),
      ),
    );
  }

}