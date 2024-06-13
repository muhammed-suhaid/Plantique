import 'package:flutter/material.dart';

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
          background: Color(0xFFE5F1EF),
          primary: Color(0xFF2C4243),
          secondary: Color(0xFF74B49B),
        ),
      ),
     home: ,
    );
  }
}
