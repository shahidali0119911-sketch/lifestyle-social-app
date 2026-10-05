import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/widgets/chat_bubble.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_square)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: AppTheme.softText),
                  SizedBox(width: 10),
                  Text('Search messages', style: TextStyle(color: AppTheme.softText)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _ChatThread(name: 'Maya', preview: 'Let’s meet tonight!', time: '2m ago', unread: 2),
            _ChatThread(name: 'Ava', preview: 'I shared the gallery', time: '1h ago', unread: 0),
            _ChatThread(name: 'Daniel', preview: 'Thanks for the feedback', time: '5h ago', unread: 1),
          ],
        ),
      ),
    );
  }
}

class _ChatThread extends StatelessWidget {
  const _ChatThread({
    required this.name,
    required this.preview,
    required this.time,
    required this.unread,
  });

  final String name;
  final String preview;
  final String time;
  final int unread;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ChatDetailScreen(name: name)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 24, child: Icon(Icons.person)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(preview, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppTheme.softText)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(time, style: const TextStyle(color: AppTheme.softText, fontSize: 12)),
                if (unread > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('$unread', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ChatBubble(message: 'Hey! Are you free tonight?', isMe: false),
                      ChatBubble(message: 'Yes, I am. Want to catch up?', isMe: true),
                      ChatBubble(message: 'Perfect! Let’s take a walk and grab coffee.', isMe: false),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send_rounded, color: AppTheme.primaryBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
