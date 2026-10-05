import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/utils/constants.dart';
import 'package:lifestyle_social_app/widgets/post_card.dart';
import 'package:lifestyle_social_app/widgets/story_circle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FF),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: AppTheme.primaryBlue),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Share your day...',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.dummyStoryImages.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final name = ['Maya', 'Noah', 'Lina', 'Omar', 'Zoe'][index];
                    return StoryCircle(
                      name: name,
                      imageUrl: AppConstants.dummyStoryImages[index],
                      isActive: index % 2 == 0,
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              ...AppConstants.demoPosts.map((post) {
                return PostCard(
                  username: post['username'] as String,
                  handle: post['handle'] as String,
                  avatarUrl: post['avatarUrl'] as String,
                  caption: post['caption'] as String,
                  imageUrl: post['imageUrl'] as String,
                  likes: post['likes'] as int,
                  comments: post['comments'] as int,
                  shares: post['shares'] as int,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
