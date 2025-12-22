import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/src/screens/Home/home_screen.dart';
import 'package:newapp/src/screens/Landing/landing_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
