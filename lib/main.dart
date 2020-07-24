import 'package:flutter/material.dart';
import 'package:interns_task/screens/login_screen.dart';
import 'package:interns_task/screens/registration_screen.dart';
import 'package:interns_task/screens/welcome_screen.dart';
import 'screens/image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ImageScreen.id: (context) => ImageScreen(),
      },
    );
  }
}
