import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/widgets/gradient_button.dart';
import 'package:lifestyle_social_app/screens/main_navigation_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF0FF), Color(0xFFF8F2FF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Life Style', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: AppTheme.darkText)),
                const SizedBox(height: 8),
                const Text('Connect • Share • Live.', style: TextStyle(fontSize: 16, color: AppTheme.primaryPurple, fontWeight: FontWeight.w700)),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppTheme.softText,
                    tabs: const [
                      Tab(text: 'Login'),
                      Tab(text: 'Sign Up'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      _LoginForm(),
                      _SignUpForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Welcome back', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          const Text('Sign in to continue your journey.', style: TextStyle(color: AppTheme.softText)),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot password?', style: TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(height: 16),
          GradientButton(
            label: 'Login',
            icon: Icons.login_rounded,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
          const Center(child: Text('or continue with', style: TextStyle(color: AppTheme.softText))),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text('Google'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.apple),
                  label: const Text('Apple'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          const Text('Join the Life Style community.', style: TextStyle(color: AppTheme.softText)),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Full name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 20),
          GradientButton(
            label: 'Create Account',
            icon: Icons.person_add_alt_1_rounded,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
              );
            },
          ),
          const SizedBox(height: 18),
          const Center(
            child: Text(
              'By continuing, you agree to our Terms and Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.softText, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
