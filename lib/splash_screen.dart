import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uibasic/home_screen.dart';
import 'package:uibasic/signup_screen.dart';
import 'login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Image(
                  image: AssetImage('images/logo.jpeg')
              )
          ),
        ),
      ),
    );
  }
}
