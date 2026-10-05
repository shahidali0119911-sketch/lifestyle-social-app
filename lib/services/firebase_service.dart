import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  static const String projectId = 'life-style-8d93a';
  static const String packageName = 'Com.lifestyle.social';
}
