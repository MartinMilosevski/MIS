import 'package:flutter/material.dart';
import 'package:lab1_203086/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '203086',
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
      },
    );
  }

}
