import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {'title': 'Aisha liked your post', 'time': '2m ago', 'icon': Icons.favorite},
    {'title': 'Mila commented on your story', 'time': '18m ago', 'icon': Icons.chat_bubble},
    {'title': 'Sam followed you', 'time': '1h ago', 'icon': Icons.person_add},
    {'title': 'You have a new mention', 'time': '3h ago', 'icon': Icons.alternate_email},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notifications.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item['icon'], color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title'], style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(item['time'], style: const TextStyle(color: AppTheme.softText, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
