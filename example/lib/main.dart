import 'package:flutter/material.dart';
import 'package:juxtapose/juxtapose.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juxtapose Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DuoJuxtapose(
        initialPosition: 0.1,
        primaryForegroundWidget: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            "Juxtapose",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
        primaryBackgroundWidget: Container(
          alignment: Alignment.center,
          color: Colors.pink,
          child: Text(
            "Juxtapose",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ),
        secondaryForegroundWidget: Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text(
            "Juxtapose",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
