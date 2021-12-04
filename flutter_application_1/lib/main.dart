import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/page/store.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadFox',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {"/homeScreen": (_) => new Home()},
    );
  }
}
