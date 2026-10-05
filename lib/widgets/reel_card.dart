import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class ReelCard extends StatelessWidget {
  const ReelCard({
    super.key,
    required this.username,
    required this.caption,
    required this.music,
    required this.likes,
    required this.comments,
  });

  final String username;
  final String caption;
  final String music;
  final int likes;
  final int comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1F5EFF), Color(0xFF8B5CF6)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.12), Colors.black.withOpacity(0.65)],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: AppTheme.primaryBlue),
                    ),
                    const SizedBox(width: 10),
                    Text(username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 8),
                Text(caption, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(music, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.white),
                    const SizedBox(width: 6),
                    Text('$likes', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 20),
                    const Icon(Icons.comment, color: Colors.white),
                    const SizedBox(width: 6),
                    Text('$comments', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    const Icon(Icons.play_arrow_rounded, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
