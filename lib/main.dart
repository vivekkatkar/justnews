import 'package:flutter/material.dart';
import 'package:justnews/home.dart';
import 'package:justnews/SignUpPage.dart';
import 'package:justnews/first.dart';
import 'package:justnews/interests.dart';
import 'package:justnews/termsConditions.dart';
import 'package:justnews/user_admin.dart';
import 'SplashScreen.dart';
import 'Login.dart';
import 'register.dart';
import 'user_admin.dart';
import 'interests.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      "user_admin": (context) => user_admin(),
      "interests": (context) => NewsScreen(),
      "termsConditions": (context) => CreatePostPage(),
    });
  }
}
