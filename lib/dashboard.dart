import 'package:flutter/material.dart';
import 'package:layout_builder/encryption_demo.dart';
import 'package:layout_builder/layout_builder_demo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['Layout Builder', 'Encryption'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Functionalities",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff111111),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0Xff111111),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: items.length,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 80,
          ),
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () {
                late var destination;
                switch(index) {
                  case 0:
                    destination = LayoutBuilderDemo();
                  case 1:
                    destination = EncryptionDemo();
                }
                Navigator.push(context, MaterialPageRoute(builder:(context) => destination));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff1f1f1f),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    items[index],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
