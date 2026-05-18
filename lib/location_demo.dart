import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationDemo extends StatefulWidget{
  const LocationDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LocationState();
  }
}

class _LocationState extends State<LocationDemo> {
  String location = "";
  double lat = 0.0;
  double long = 0.0;

  Future<void> fetchLocation() async{
    Position position =  await Geolocator.getCurrentPosition(locationSettings:  LocationSettings(accuracy: LocationAccuracy.high));
    setState(() {
      lat = position.latitude;
      long = position.longitude;
      location = "Latitude:$lat and Longitude:$long";
    });

  }

  Future<void> requestLocationPermission() async{
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.whileInUse) {
        fetchLocation();
      }
    }

    if(locationPermission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }

    fetchLocation();
  }

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Location Demo"),),
      floatingActionButton: FloatingActionButton(onPressed: requestLocationPermission),
      body: Center(
        child: Column(
          children: [
            Text(location),
            SizedBox(height: 20,),
            Text("address")
          ],
        ),
    ),);
  }

}