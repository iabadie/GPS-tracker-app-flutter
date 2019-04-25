import 'package:flutter/material.dart';
import 'package:gps_tracker_app/screens/gpsMap/MapScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPS Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MapScreen()
    );
  }
}
