import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/screens/home_screen.dart';
import 'package:lifestyle_social_app/screens/messages_screen.dart';
import 'package:lifestyle_social_app/screens/notifications_screen.dart';
import 'package:lifestyle_social_app/screens/profile_screen.dart';
import 'package:lifestyle_social_app/screens/reels_screen.dart';
import 'package:lifestyle_social_app/screens/search_screen.dart';
import 'package:lifestyle_social_app/screens/settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SearchScreen(),
    ReelsScreen(),
    MessagesScreen(),
    NotificationsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(icon: Icons.home_rounded, label: 'Home', isSelected: _currentIndex == 0, onTap: () => setState(() => _currentIndex = 0)),
                _NavItem(icon: Icons.search_rounded, label: 'Search', isSelected: _currentIndex == 1, onTap: () => setState(() => _currentIndex = 1)),
                _NavItem(icon: Icons.videocam_rounded, label: 'Reels', isSelected: _currentIndex == 2, onTap: () => setState(() => _currentIndex = 2)),
                _NavItem(icon: Icons.chat_bubble_rounded, label: 'Chat', isSelected: _currentIndex == 3, onTap: () => setState(() => _currentIndex = 3)),
                _NavItem(icon: Icons.notifications_none_rounded, label: 'Alerts', isSelected: _currentIndex == 4, onTap: () => setState(() => _currentIndex = 4)),
                _NavItem(icon: Icons.person_rounded, label: 'Me', isSelected: _currentIndex == 5, onTap: () => setState(() => _currentIndex = 5)),
                _NavItem(icon: Icons.settings_rounded, label: 'Settings', isSelected: _currentIndex == 6, onTap: () => setState(() => _currentIndex = 6)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.primaryBlue : AppTheme.softText,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.primaryBlue : AppTheme.softText,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
