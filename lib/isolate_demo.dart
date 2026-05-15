import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateDemo extends StatelessWidget{
  const IsolateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Isolate Demo"),),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/gifs/bouncing_ball.gif'),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
             var count = await task1();
             print(count);
            }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1f1f1f)), child: Text("Without Isolate", style: TextStyle(color: Colors.white),),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              ReceivePort receiverPort = ReceivePort();
              await Isolate.spawn(task2, receiverPort.sendPort);
              receiverPort.listen((total) {
                print(total);
              });

            }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1f1f1f)), child: Text("With Isolate", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }

  Future<int> task1() async{
    int count = 0;
    for(int i = 0; i < 1000000000; i++){
      count += i;
    }

    return count;
  }

  void task2(SendPort sendPort) {
    int count = 0;
    for(int i = 0; i < 1000000000; i++){
      count += i;
    }
    sendPort.send(count);
  }

}