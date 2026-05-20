import 'package:flutter/material.dart';

class ValueListenableDemo extends StatelessWidget {
  const ValueListenableDemo({super.key});

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<String> notifier = ValueNotifier<String>("No Change");
    final ValueNotifier<int> count = ValueNotifier<int>(0);

    return Scaffold(appBar: AppBar(
      title: Text("Value Listenable Demo"),
    ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, value, child) {
              return Center(
                child: Text("$value"),
              );
            }
          ),
          SizedBox(height: 20,),
          ValueListenableBuilder(
              valueListenable: count,
              builder: (context, value, child) {
                return Center(
                  child: Text("$value"),
                );
              }
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notifier.value = "Value change successfully";
          count.value++;
        }, child: Text("Update"),),
    );
  }
}