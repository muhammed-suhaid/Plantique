import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantique/firebase_options.dart';
import 'package:plantique/pages/intro_page/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
          secondary: Color.fromARGB(255, 219, 238, 237),
          tertiary: Color(0xFFE5F1EF),
        ),
      ),
      home: const IntroScreen(),
    );
  }
}
