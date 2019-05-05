import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http_server/http_server.dart';
import 'dart:io';

class InformationScreen extends StatefulWidget {
  InformationScreen({Key key}) : super(key: key);

  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  HttpServer httpServer;
  int lastPosition = 0;
  bool serverStarted = false;

  // void _startWebServer() {
  //   print("Hola!");
  //   ServerSocket.bind(InternetAddress.anyIPv6, 8000)
  //   .then((serverSocket) {
  //     print("Hola");
  //     print(serverSocket.address);
  //     print(serverSocket.port);
  //     this.httpServer = new HttpServer.listenOn(serverSocket);
  //     serverSocket.listen((Socket socket) {
  //       socket.write('Hello, client.');
  //     });
  //   });
  // }

  Future _startWebServer() async {
    if (this.serverStarted) return;
    setState(() {
      serverStarted = true;
    });
    runZoned(() {
      HttpServer.bind(InternetAddress.anyIPv6, 8000).then((server) {
        print('Server running at: ${server.address.address}');
        server.transform(HttpBodyHandler()).listen((HttpRequestBody body) async {
          print('Request URI');
          switch (body.request.uri.toString()) {
            case '/tracker/last': {
              body.request.response.statusCode = 200;
              body.request.response.write('{index: ' + this.lastPosition.toString() + '}');
              body.request.response.close();
              break;
            }
            case '/tracker/new-items': {
              body.request.response.statusCode = 200;
              setState(() {
                lastPosition+=1;
              });
              body.request.response.write('Received');
              body.request.response.close();
              break;
            }
            default: {
              body.request.response.statusCode = 404;
              body.request.response.write('Not found');
              body.request.response.close();
            }
          }
        });
      });
    },
        onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Server')
          ),
          body: Center(
            child: RaisedButton(
              child: Text(this.serverStarted ? "Server iniciado. http://192.168.43.1:8000/tracker" : "Al presionar Aquí se inicia el Web Server"),
              onPressed: () {this._startWebServer();},
            )
          )
    );
  }
}