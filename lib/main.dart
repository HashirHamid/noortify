import 'package:flutter/material.dart';
import 'package:noortify/modules/home/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Noortify());
}

class Noortify extends StatelessWidget {
  const Noortify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noortify',
      home: HomeScreen(),
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 33, 29, 29),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 33, 29, 29),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Authentication Wrapper',
        ),
      ),
    );
  }
}
