import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  Config({Key key}) : super(key: key);

  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración ESP32")
      ),
      body: Center(
          child: Text(
            "*Asegurese de estar conectado al dispositivo para operar.",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600))
        )
    );
  }
}