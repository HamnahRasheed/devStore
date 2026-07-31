import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btn;
  final VoidCallback onPressed;
  //final Widget destination;
  const MyButton({super.key, required this.btn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
