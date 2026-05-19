import 'package:flutter/material.dart';
import 'package:layout_builder/custom_widget/custom/custom_button.dart';
import 'package:layout_builder/custom_widget/custom/custom_container.dart';

class CustomWidgetDemo extends StatelessWidget {
  const CustomWidgetDemo({super.key});

  void onClick(BuildContext context, String str) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(str)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widgets")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainer(onClick: (String str){
                  onClick(context, str);
                }, color: Colors.yellow, child: const Text("Siddhesh")),
                SizedBox(width: 15,),
                CustomContainer(onClick: (String str){
                  onClick(context, str);
                }, color: Colors.yellow, child: const Text("Yuthika")),
              ],
            ), SizedBox(height: 20,),
            CustomButton(onClick: (String str){
              onClick(context, str);
            }, str: "Click Me", color: Colors.orange, height: 30),
            SizedBox(height: 20,),
            CustomButton(onClick: (String str){
              onClick(context, str);
            }, str: "Press Me", color: Colors.blue, height: 50)
          ],
        ),
      ),
    );
  }
}
