import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 180, width: 180,
                  image: AssetImage('images/logo.jpeg'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text('Sign Up',
                style: TextStyle(
                  fontSize: 32, fontFamily: 'Inter-Bold',
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  hintStyle: TextStyle(color: Colors.white54),
                  fillColor: Color(0xff1E1E1E),
                  filled: true,
                  prefixIcon: Icon(Icons.person, color: Colors.white54),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: Colors.white54),
                  fillColor: Color(0xff1E1E1E),
                  filled: true,
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white54),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Contact ',
                  hintStyle: TextStyle(color: Colors.white54),
                  fillColor: Color(0xff1E1E1E),
                  filled: true,
                  prefixIcon: Icon(Icons.phone, color: Colors.white54),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(
                    Icons.lock_open_rounded,
                    color: Colors.white54,
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.white54),
                  fillColor: Color(0xff1E1E1E),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3F3F46)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50, width: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 24, fontFamily: 'Inter-Bold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, fontFamily: 'Inter-Light',
                  ),
                ),
                SizedBox(width: 5),
                Text('Login',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18, fontFamily: 'Inter-Bold',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
