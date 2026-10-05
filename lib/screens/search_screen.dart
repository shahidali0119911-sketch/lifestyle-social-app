import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Aisha Khan', 'tag': '@aisha', 'followers': '12.4k'},
      {'name': 'Samir Ali', 'tag': '@sam', 'followers': '9.1k'},
      {'name': 'Lina Moore', 'tag': '@lina', 'followers': '7.9k'},
      {'name': 'Noah James', 'tag': '@noah', 'followers': '15.8k'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: AppTheme.softText),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search people...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            child: Icon(Icons.person),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user['name'] as String, style: const TextStyle(fontWeight: FontWeight.w700)),
                                const SizedBox(height: 3),
                                Text(user['tag'] as String, style: const TextStyle(color: AppTheme.softText)),
                              ],
                            ),
                          ),
                          Text('${user['followers']} followers', style: const TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
