import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  height: 180,
                  width: 180,
                  image: AssetImage('images/logo.jpeg'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Inter-Bold',
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration:  InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Colors.white54
                  ),
                  fillColor: Color(0xff1E1E1E),
                  filled: true,
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.white54,),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff3F3F46)
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff3F3F46)
                      ),
                      borderRadius: BorderRadius.circular(20)
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
                  hintStyle: TextStyle(
                    color: Colors.white54
                  ),
                  prefixIcon: Icon(Icons.lock_open_rounded,color: Colors.white54),
                  suffixIcon: Icon(Icons.visibility_off,color: Colors.white54),
                  fillColor: Color(0xff1E1E1E),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff3F3F46)
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff3F3F46)
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontFamily: 'Inter-Light',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter-Bold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter-Light',
                  ),
                ),
                SizedBox(width: 5),
                Text('Sign up',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'Inter-Bold',
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
