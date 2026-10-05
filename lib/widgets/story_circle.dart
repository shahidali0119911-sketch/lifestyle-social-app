import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isActive = false,
  });

  final String name;
  final String imageUrl;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: isActive ? AppTheme.primaryGradient : null,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? Colors.transparent : const Color(0xFFE5E7EB),
                width: 1.5,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: 56,
                  height: 56,
                  placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
                  errorWidget: (context, url, error) => const Icon(Icons.person),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
