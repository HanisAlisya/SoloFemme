import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart'; // 👈 Add this line

void main() {
  runApp(const SoloFemmeApp());
}

class SoloFemmeApp extends StatelessWidget {
  const SoloFemmeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoloFemme',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const WelcomeScreen(),
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
