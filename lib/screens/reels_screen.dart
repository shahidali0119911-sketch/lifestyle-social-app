import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/widgets/reel_card.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  final List<Map<String, dynamic>> reels = const [
    {'username': 'Mila', 'caption': 'Morning routine', 'music': 'Original audio • 125k', 'likes': 48700, 'comments': 2200},
    {'username': 'Theo', 'caption': 'Weekend energy', 'music': 'Trending track • 98k', 'likes': 29000, 'comments': 890},
    {'username': 'Rania', 'caption': 'City walk vibes', 'music': 'Chill beat • 45k', 'likes': 16750, 'comments': 540},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: reels.length,
            itemBuilder: (context, index) {
              final reel = reels[index];
              return ReelCard(
                username: reel['username'] as String,
                caption: reel['caption'] as String,
                music: reel['music'] as String,
                likes: reel['likes'] as int,
                comments: reel['comments'] as int,
              );
            },
          ),
        ),
      ),
    );
  }
}
