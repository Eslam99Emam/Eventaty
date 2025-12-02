import 'package:eventaty/pages/details_screen.dart';
import 'package:eventaty/pages/home_screen.dart';
import 'package:eventaty/pages/login_screen.dart';
import 'package:eventaty/pages/qr_screen.dart';
import 'package:eventaty/pages/register_screen.dart';
import 'package:eventaty/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/details': (context) => DetailsScreen(),
        '/qr': (context) => QrScreen(),
      }
    );
  }
}