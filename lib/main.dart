import 'package:flutter/material.dart';
import 'package:justnews/home.dart';
import 'package:justnews/SignUpPage.dart';
import 'package:justnews/first.dart';
import 'SplashScreen.dart';
import 'Login.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => SplashScreen(),
      "login": (context) => Login(),
      "signup": (context) => SignUpPage(),
      "homepage": (context) => home(),
    });
  }
}
