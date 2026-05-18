import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraDemo extends StatefulWidget{
  const CameraDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CameraState();
  }
}

class _CameraState extends State<CameraDemo> {
  File? camerafile;

  Future<void> requestCameraPermission() async{
      var status =  await Permission.camera.status;

      if(status.isDenied) {
        if(await Permission.camera.status.isGranted) {
          captureImage();
        }
      } else {
        captureImage();
      }
  }

  Future<void> captureImage() async{
      final ImagePicker imagePicker = ImagePicker();
      
      final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null) {
        setState(() {
          camerafile = File(pickedImage!.path);
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera Demo"),),
      floatingActionButton: FloatingActionButton(onPressed: captureImage, child: Icon(Icons.camera_alt),),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: camerafile == null ? Center(child: Text("No Image"),) : Image.file(camerafile!, height: 300, width: double.infinity,),
      ),
    );
  }

}