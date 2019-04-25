import 'package:flutter/material.dart';
import 'package:gps_tracker_app/screens/config/Config.dart';
import 'package:gps_tracker_app/screens/gpsMap/GpsMap.dart';
import 'package:gps_tracker_app/screens/Information/Information.dart';

void main() => runApp(MapScreen());

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  void goToSettingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Config()),
    );
  }

  void goToInformationScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('GPS Tracker'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  goToSettingScreen(context);
                }
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  setState(() {
                    goToInformationScreen(context);
                  });
                }
              )
            ],
          ),
          body: GpsMap()
    );
  }
}