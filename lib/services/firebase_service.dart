import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static const String projectId = 'life-style-8d93a';
  static const String packageName = 'com.lifestyle.social';

  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseFirestore get firestore => FirebaseFirestore.instance;

  static Future<void> initialize() async {
    // Firebase is initialized in main.dart
  }

  static Stream<User?> get authStateChanges => auth.authStateChanges();

  static Future<void> signOut() async {
    await auth.signOut();
  }
}
