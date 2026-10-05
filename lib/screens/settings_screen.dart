import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SettingSection(title: 'Account', items: [
              _SettingItem(label: 'Edit profile', icon: Icons.person_outline),
              _SettingItem(label: 'Privacy', icon: Icons.lock_outline),
              _SettingItem(label: 'Security', icon: Icons.shield_outlined),
            ]),
            const SizedBox(height: 20),
            _SettingSection(title: 'Preferences', items: [
              _SettingItem(label: 'Notifications', icon: Icons.notifications_none),
              _SettingItem(label: 'Theme', icon: Icons.palette_outlined),
              _SettingItem(label: 'Language', icon: Icons.language),
            ]),
            const SizedBox(height: 20),
            _SettingSection(title: 'Support', items: [
              _SettingItem(label: 'Help center', icon: Icons.help_outline),
              _SettingItem(label: 'Terms & Privacy', icon: Icons.description_outlined),
              _SettingItem(
                label: 'Log out',
                icon: Icons.logout_rounded,
                danger: true,
                onTap: () async {
                  await AuthService.signOut();
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class _SettingSection extends StatelessWidget {
  const _SettingSection({required this.title, required this.items});

  final String title;
  final List<_SettingItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.label,
    required this.icon,
    this.danger = false,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool danger;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: danger ? Colors.red : AppTheme.primaryBlue),
      title: Text(
        label,
        style: TextStyle(
          color: danger ? Colors.red : AppTheme.darkText,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15, color: AppTheme.softText),
      onTap: onTap ?? () {},
    );
  }
}
