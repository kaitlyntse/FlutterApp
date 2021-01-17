import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Dashboard(title: 'Flutter Demo Home Page'),
    );
  }
}
