import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dev_store/Screens/home_screen.dart';
import 'package:dev_store/Screens//my_button.dart';
import 'package:dev_store/Screens//signup_screen.dart';
import 'package:dev_store/Provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose(); }
  void _onLoginPressed() async {
    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.login(
      _emailController.text,
      _passwordController.text, );
    if (success && mounted) {
      Navigator.pushReplacement( context, MaterialPageRoute(
            builder: (context) => const HomeScreen()),);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage),
          backgroundColor: Colors.red,
        ),); }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea( child: Column(
            children: [ const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image( height: 180, width: 180,
                    image: AssetImage('images/DevStores.png'),),
                ],),
              const SizedBox(height: 20),
              const Center(
                child: Text( 'Log In',
                  style: TextStyle( color: Colors.green,
                    fontSize: 32, fontFamily: 'Inter-Bold', ), ),),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white54),
                    fillColor: const Color(0xff1E1E1E),  filled: true,
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.white54),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20),),
                  ),),),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(Icons.lock_open_rounded, color: Colors.white54),
                    suffixIcon: IconButton(
                      icon: Icon( color: Colors.white54,
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off, ),
                      onPressed: () { setState(() {
                          _isPasswordVisible = !_isPasswordVisible; });},
                    ),
                    fillColor: const Color(0xff1E1E1E),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20),),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),),
                ),),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text( 'Forgot password?',
                    style: TextStyle( color: Colors.white,
                      fontFamily: 'Inter-Light', fontSize: 16, ),), ), ),
              const SizedBox(height: 50),
              MyButton( btn: 'Log In', onPressed: _onLoginPressed, ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text( 'Don\'t have an account?',
                    style: TextStyle( color: Colors.white,
                      fontSize: 18, fontFamily: 'Inter-Light',), ),
                  TextButton( onPressed: () {
                      Navigator.push( context, MaterialPageRoute(
                          builder: (context) => const SignupScreen()),); },
                    child: const Text( 'Sign up',
                      style: TextStyle( color: Colors.green,
                        fontSize: 18,  fontFamily: 'Inter-Bold', ),),),
                ],),],), ),),);}
}