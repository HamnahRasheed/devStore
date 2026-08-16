import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dev_store/Screens/home_screen.dart';
import 'package:dev_store/Screens/login_screen.dart';
import 'package:dev_store/Screens/my_button.dart';
import 'package:dev_store/Provider/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _onSignupPressed() async {
    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.signup(
      name: _nameController.text,
      email: _emailController.text,
      contact: _contactController.text,
      password: _passwordController.text, );

    if (success && mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => const HomeScreen()),);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage),
          backgroundColor: Colors.red, ),); }
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
                  Image( height: 180, width: 180,
                    image: AssetImage('images/DevStores.png'),),
                ],),
              const SizedBox(height: 20),
              const Center(
                child: Text( 'Sign Up',
                  style: TextStyle( color: Colors.green,
                    fontSize: 32, fontFamily: 'Inter-Bold',),
                ),),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    hintStyle: const TextStyle(color: Colors.white54),
                    fillColor: const Color(0xff1E1E1E), filled: true,
                    prefixIcon: const Icon(Icons.person, color: Colors.white54),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                  ),), ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(color: Colors.white54),
                    fillColor: const Color(0xff1E1E1E), filled: true,
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.white54),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20),),
                  ),), ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: _contactController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter Contact',
                    hintStyle: const TextStyle(color: Colors.white54),
                    fillColor: const Color(0xff1E1E1E),  filled: true,
                    prefixIcon: const Icon(Icons.phone, color: Colors.white54),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                  ),), ),
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
                          _isPasswordVisible = !_isPasswordVisible; }); }, ),
                    fillColor: const Color(0xff1E1E1E), filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3F3F46)),
                      borderRadius: BorderRadius.circular(20), ),
                  ), ), ),
              const SizedBox(height: 30),
              MyButton( btn: 'Sign Up', onPressed: _onSignupPressed, ),
              const SizedBox(height: 10),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text( 'Already have an account!',
                    style: TextStyle( color: Colors.white,
                      fontSize: 18, fontFamily: 'Inter-Light',), ),
                  TextButton( onPressed: () {
                      Navigator.push( context, MaterialPageRoute(
                            builder: (context) => const LoginScreen()), ); },
                    child: const Text( 'Login',
                      style: TextStyle( color: Colors.green,
                        fontSize: 18, fontFamily: 'Inter-Bold', ),
                    ),),], ), ], ), ),
      ),); } }