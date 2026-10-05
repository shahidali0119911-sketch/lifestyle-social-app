import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_social_app/app_theme.dart';
import 'package:lifestyle_social_app/screens/main_navigation_screen.dart';
import 'package:lifestyle_social_app/services/auth_service.dart';
import 'package:lifestyle_social_app/widgets/gradient_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();
  final TextEditingController _signUpNameController = TextEditingController();
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signUpNameController.dispose();
    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _handleLogin() async {
    final email = _loginEmailController.text.trim();
    final password = _loginPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please enter your email and password.');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await AuthService.signIn(email: email, password: password);

      if (!mounted) {
        return;
      }

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      _showMessage(_getAuthErrorMessage(error));
    } catch (_) {
      _showMessage('Unable to log in right now. Please try again.');
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _handleSignUp() async {
    final name = _signUpNameController.text.trim();
    final email = _signUpEmailController.text.trim();
    final password = _signUpPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Please complete all fields to create your account.');
      return;
    }

    if (password.length < 6) {
      _showMessage('Password must be at least 6 characters long.');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await AuthService.signUp(
        name: name,
        email: email,
        password: password,
      );

      if (!mounted) {
        return;
      }

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      _showMessage(_getAuthErrorMessage(error));
    } catch (_) {
      _showMessage('Unable to create your account right now.');
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  String _getAuthErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-not-found':
        return 'No account found for this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists for this email.';
      case 'weak-password':
        return 'Please choose a stronger password.';
      case 'invalid-name':
        return 'Please enter a valid full name.';
      default:
        return error.message ?? 'Authentication failed. Please try again.';
    }
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
                const Text(
                  'Life Style',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Connect • Share • Live.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.primaryPurple,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                    children: [
                      _LoginForm(
                        emailController: _loginEmailController,
                        passwordController: _loginPasswordController,
                        isSubmitting: _isSubmitting,
                        onSubmit: _handleLogin,
                      ),
                      _SignUpForm(
                        nameController: _signUpNameController,
                        emailController: _signUpEmailController,
                        passwordController: _signUpPasswordController,
                        isSubmitting: _isSubmitting,
                        onSubmit: _handleSignUp,
                      ),
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
  const _LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.isSubmitting,
    required this.onSubmit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome back',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sign in to continue your journey.',
            style: TextStyle(color: AppTheme.softText),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            decoration: const InputDecoration(
              hintText: 'Email address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            autofillHints: const [AutofillHints.password],
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
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: AppTheme.primaryBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          GradientButton(
            label: isSubmitting ? 'Logging in...' : 'Login',
            icon: Icons.login_rounded,
            onPressed: isSubmitting ? null : onSubmit,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text('or continue with', style: TextStyle(color: AppTheme.softText)),
          ),
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
  const _SignUpForm({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.isSubmitting,
    required this.onSubmit,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create account',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          const Text(
            'Join the Life Style community.',
            style: TextStyle(color: AppTheme.softText),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: 'Full name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            decoration: const InputDecoration(
              hintText: 'Email address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            autofillHints: const [AutofillHints.newPassword],
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 20),
          GradientButton(
            label: isSubmitting ? 'Creating account...' : 'Create Account',
            icon: Icons.person_add_alt_1_rounded,
            onPressed: isSubmitting ? null : onSubmit,
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
