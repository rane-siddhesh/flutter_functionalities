import 'package:flutter/material.dart';

class LayoutBuilderDemo extends StatelessWidget{
  const LayoutBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout Builder"),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(builder: (context, constraints) {
          if(constraints.maxWidth > 480) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.purple),
                    // height: constraints.maxHeight * 0.5,
                    child: Align(alignment: Alignment.center, child: const Text("Partition 1", style: const TextStyle(color: Colors.white, fontSize: 20),)),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.amber),
                    // height: constraints.maxHeight * 0.5,
                    child: Align(alignment: Alignment.center, child: const Text("Partition 2", style: const TextStyle(color: Colors.white, fontSize: 20),)),
                  ),
                )
              ],
            );
          } else {
            return Container(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              height: constraints.maxHeight * 0.5,
              child: Align(alignment: Alignment.center, child: const Text("Mobile UI", style: const TextStyle(color: Colors.white, fontSize: 20),)),
            );
          }
        },),
      ),
    );
  }

}