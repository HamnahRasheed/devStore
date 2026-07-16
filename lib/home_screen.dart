import 'package:flutter/material.dart';
import 'package:uibasic/login_screen.dart';
import 'package:uibasic/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('DevSphere',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter-Bold', fontSize: 24,
            ),),),
        backgroundColor: Colors.green,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text('Welcome to ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, fontFamily: 'Inter-light',
                ),),
              Text('DevSphere!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24, fontFamily: 'Inter-Bold',
                ),),
            ],),
          SizedBox(height: 40),
          MyButton(btn: 'Log Out', destination: LoginScreen()),
        ],),
    );
  }
}
