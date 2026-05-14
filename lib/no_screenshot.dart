import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';

class NoScreenshotDemo extends StatefulWidget {
  const NoScreenshotDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NoScreenshotDemoState();
  }
}

class _NoScreenshotDemoState extends State<NoScreenshotDemo> {
  final _noScreenshot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    _noScreenshot.screenshotOff();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        print('Back navigation invoked: $didPop');


        _noScreenshot.screenshotOn();
        print("PopSCope");

      },
      child: Scaffold(
        appBar: AppBar(title: Text("No Screenshot")),
        body: Center(
          child:  Column(
            children: [
              Text(
                  "No Screenshot and\nNo Screen Recording",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ElevatedButton(onPressed: (){
                _noScreenshot.screenshotOn();
              }, child: Text("On", style: TextStyle(color: Colors.white),)),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                _noScreenshot.screenshotOff();
              }, child: Text("Off", style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}
