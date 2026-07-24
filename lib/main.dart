import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/cart_provider.dart';
import 'Provider/product_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'DevStore',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Inter-Bold'),
        home: const HomeScreen(),
      ),
    );
  }
}
