import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/input_page.dart';
import 'package:mini_proyecto/src/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), 
    );
  }
}




