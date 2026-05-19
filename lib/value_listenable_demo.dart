import 'package:flutter/material.dart';

class ValueListenableDemo extends StatelessWidget {
  const ValueListenableDemo({super.key});

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<String> notifier = ValueNotifier<String>("No Change");

    return Scaffold(appBar: AppBar(
      title: Text("Value Listenable Demo"),
    ),
      body: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) {
          return Center(
            child: Text("$value"),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notifier.value = "Value change successfully";
        }, child: Text("Update"),),
    );
  }
}