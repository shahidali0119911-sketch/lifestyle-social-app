import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String username;
  final String bio;
  final String avatarUrl;
  final bool isVerified;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.username,
    required this.bio,
    required this.avatarUrl,
    required this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'username': username,
      'bio': bio,
      'avatarUrl': avatarUrl,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      bio: map['bio'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      isVerified: map['isVerified'] ?? false,
    );
  }
}
