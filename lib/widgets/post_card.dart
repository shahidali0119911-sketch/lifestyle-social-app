import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.username,
    required this.handle,
    required this.avatarUrl,
    required this.caption,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  final String username;
  final String handle;
  final String avatarUrl;
  final String caption;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppTheme.primaryPurple.withOpacity(0.2),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrl,
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
                    errorWidget: (context, url, error) => const Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Text(handle, style: const TextStyle(color: AppTheme.softText, fontSize: 12)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: AppTheme.softText),
            ],
          ),
          const SizedBox(height: 12),
          Text(caption, style: const TextStyle(fontSize: 15, height: 1.45)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 220,
                color: const Color(0xFFE9EBFF),
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 220,
                color: const Color(0xFFE9EBFF),
                child: const Center(child: Icon(Icons.broken_image, size: 40)),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildAction(Icons.favorite_border, '$likes'),
              const SizedBox(width: 12),
              _buildAction(Icons.chat_bubble_outline, '$comments'),
              const SizedBox(width: 12),
              _buildAction(Icons.share_outlined, '$shares'),
              const Spacer(),
              const Icon(Icons.bookmark_border, color: AppTheme.softText),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppTheme.softText),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: AppTheme.softText, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
