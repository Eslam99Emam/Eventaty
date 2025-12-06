import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'package:eventaty/view_models/auth_view_model.dart';
import 'package:eventaty/view_models/home_view_model.dart';
import 'package:eventaty/views/details_screen.dart';
import 'package:eventaty/views/home_screen.dart';
import 'package:eventaty/views/login_screen.dart';
import 'package:eventaty/views/qr_screen.dart';
import 'package:eventaty/views/register_screen.dart';
import 'package:eventaty/views/splash_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ixbljrkchrutpgosvogt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4YmxqcmtjaHJ1dHBnb3N2b2d0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ4NzAwOTUsImV4cCI6MjA4MDQ0NjA5NX0.xHakzPWUHx_l8hOK8XMCFKOQxBd-pA-nQV68x3dHtYs',
  );

  runApp(MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel()..initialize(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          // '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/details': (context) => const DetailsScreen(),
          '/qr': (context) => const QrScreen(),
        },
      ),
    );
  }
}