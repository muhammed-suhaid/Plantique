import 'package:flutter/material.dart';
import 'package:plantique/pages/intro_page/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plantique',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          primary: Color.fromARGB(255, 45, 108, 104),
          secondary: Color.fromARGB(255, 128, 190, 197),
          tertiary: Color(0xFFE5F1EF),
        ),
      ),
      home: const IntroScreen(),
    );
  }
}
