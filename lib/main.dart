import 'package:dev_store/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dev_store/Provider/product_provider.dart';
import 'package:dev_store/Provider/cart_provider.dart';
import 'package:dev_store/Provider/auth_provider.dart';
void main() {
  runApp(const MyApp());}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..checkAutoLogin()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return MaterialApp(
            title: 'DevStore',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Inter-Bold'),
            home: SplashScreen(), );},
      ),);
  }}