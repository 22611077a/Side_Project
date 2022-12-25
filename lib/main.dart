import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blueGrey)
    );
    return MaterialApp(
      title: 'Todoapp',
      home: Home(),
    );
  }
}

