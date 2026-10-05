import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: AppTheme.primaryBlue, size: 30),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Sofia James',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      const Text('@sofia', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6F7FF),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          _Stat(label: 'Posts', value: '152'),
                          _Stat(label: 'Followers', value: '24.8k'),
                          _Stat(label: 'Following', value: '492'),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Travel enthusiast • Food lover • Building meaningful connections.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppTheme.softText, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryBlue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Edit Profile'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppTheme.primaryPurple,
                                side: const BorderSide(color: AppTheme.primaryPurple),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Share Profile'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Recent Posts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                          Text('View all', style: TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          _PostThumb(color: Color(0xFFDBEAFE)),
                          _PostThumb(color: Color(0xFFE9D5FF)),
                          _PostThumb(color: Color(0xFFDCFCE7)),
                          _PostThumb(color: Color(0xFFFDE68A)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppTheme.softText)),
      ],
    );
  }
}

class _PostThumb extends StatelessWidget {
  const _PostThumb({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 38, color: AppTheme.primaryBlue),
      ),
    );
  }
}
