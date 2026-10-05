import 'package:flutter/material.dart';

class AppConstants {
  static const List<String> dummyStoryImages = [
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=500&q=80',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=500&q=80',
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=500&q=80',
    'https://images.unsplash.com/photo-1521119989659-a83eee488004?auto=format&fit=crop&w=500&q=80',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=500&q=80',
  ];

  static const List<Map<String, dynamic>> demoPosts = [
    {
      'username': 'Aisha Khan',
      'handle': '@aisha',
      'avatarUrl': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=500&q=80',
      'caption': 'Sunset with friends and great energy. Life is amazing when you share it with the right people.',
      'imageUrl': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=1200&q=80',
      'likes': 2450,
      'comments': 180,
      'shares': 64,
    },
    {
      'username': 'Samir Ali',
      'handle': '@sam',
      'avatarUrl': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=500&q=80',
      'caption': 'New ideas, new goals, new wins. Building something that inspires people around me.',
      'imageUrl': 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=80',
      'likes': 3200,
      'comments': 240,
      'shares': 128,
    },
  ];
}
