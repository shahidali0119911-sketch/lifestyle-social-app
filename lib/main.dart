import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/screens/auth_screen.dart';
import 'package:lifestyle_social_app/screens/main_navigation_screen.dart';
import 'package:lifestyle_social_app/services/auth_service.dart';

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
      home: StreamBuilder<User?>(
        stream: AuthService.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasData) {
            return const MainNavigationScreen();
          }

          return const AuthScreen();
        },
      ),
    );
  }
}
