import 'package:flutter/material.dart';

import 'models/cart.dart';
import 'screens/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasta Haven',
      debugShowCheckedModeBanner: false,
      home: NavPage(),
    );
  }
}
