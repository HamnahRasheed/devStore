import 'package:flutter/material.dart';
import 'package:uibasic/home_screen.dart';

class MyButton extends StatelessWidget {
  final String btn;
  final Widget destination;
  const MyButton({super.key, required this.btn, required this.destination});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: Size(250, 50),
      ),
      child: Center(
        child: Text(
          btn,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Inter-Bold',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
