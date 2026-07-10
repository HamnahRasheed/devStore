import 'package:flutter/material.dart';

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
              fontFamily: 'Inter-Bold',
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, fontFamily: 'Inter-light',
                ),
              ),
              Text('DevSphere!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24, fontFamily: 'Inter-Bold',
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            height: 50, width: 300,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Log Out',
                style: TextStyle(
                  fontSize: 24, fontFamily: 'Inter-Bold',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
