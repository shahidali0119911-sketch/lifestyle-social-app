import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const LifeStyleApp());
}

class LifeStyleApp extends StatelessWidget {
  const LifeStyleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Style',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AuthScreen(),
    );
  }
}
