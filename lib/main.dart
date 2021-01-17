import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'dart:async';
import 'package:confetti/confetti.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var bgColor;
  @override
  Widget build(BuildContext context) {
    if (DateTime.now().hour >= 8 && DateTime.now().hour <= 12) {
      bgColor = Colors.lightBlue;
    } else if (DateTime.now().hour >= 13 && DateTime.now().hour <= 16) {
      bgColor = Colors.deepOrange;
    } else {
      bgColor = Colors.indigo;
    }
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: bgColor,
      ),
      home: new Dashboard(title: 'Flutter Demo Home Page'),
    );
  }
}
