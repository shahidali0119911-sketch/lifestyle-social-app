import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  static Future<UserCredential> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    await _createUserProfile(credential.user!, name);
    return credential;
  }

  static Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> _createUserProfile(User user, String fullName) async {
    final safeName = fullName.trim();
    if (safeName.isEmpty) {
      throw FirebaseAuthException(
        code: 'invalid-name',
        message: 'Please enter a valid full name.',
      );
    }

    final usernameBase = safeName
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');

    final username = usernameBase.isEmpty ? 'user' : usernameBase;

    final docRef = _firestore.collection('users').doc(user.uid);

    await docRef.set({
      'uid': user.uid,
      'name': safeName,
      'email': user.email ?? '',
      'username': username,
      'bio': 'Hey! I am new to Life Style.',
      'avatarUrl': '',
      'isVerified': false,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
