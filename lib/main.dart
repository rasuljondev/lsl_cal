import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LSL Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Enable Material 3 for modern aesthetics
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
