import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/register_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  String? _nameError, _emailError, _phoneError, _passwordError, _confirmError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty ? 'Full name is required.' : null;
      _emailError = _emailController.text.trim().isEmpty
          ? 'Email is required.'
          : !_emailController.text.contains('@')
          ? 'Enter a valid email.'
          : null;
      _phoneError = _phoneController.text.trim().isEmpty ? 'Phone number is required.' : null;
      _passwordError =
      _passwordController.text.length < 6 ? 'Password must be at least 6 characters.' : null;
      _confirmError = _confirmController.text != _passwordController.text
          ? 'Passwords do not match.'
          : null;
    });
    return _nameError == null &&
        _emailError == null &&
        _phoneError == null &&
        _passwordError == null &&
        _confirmError == null;
  }

  Future<void> _submit() async {
    if (!_validate()) return;

    final success = await ref.read(registerControllerProvider.notifier).submit(
      fullName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phoneNumber: _phoneController.text.trim(),
      password: _passwordController.text,
    );

    if (success && mounted) {
      context.go('/login', extra: _emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(registerControllerProvider);
    final isLoading = state?.isLoading ?? false;
    final bannerError = ref.watch(registerControllerProvider.notifier).bannerError;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (bannerError != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(bannerError,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.onErrorContainer)),
              ),
              const SizedBox(height: 16),
            ],
            TextField(
              controller: _nameController,
              enabled: !isLoading,
              decoration: InputDecoration(labelText: 'Full Name', errorText: _nameError),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              enabled: !isLoading,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email', errorText: _emailError),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              enabled: !isLoading,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number', errorText: _phoneError),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              enabled: !isLoading,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', errorText: _passwordError),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmController,
              enabled: !isLoading,
              obscureText: true,
              decoration:
              InputDecoration(labelText: 'Confirm Password', errorText: _confirmError),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: isLoading ? null : _submit,
                child: isLoading
                    ? const SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Create Account'),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: isLoading ? null : () => context.go('/login'),
                child: const Text('Already have an account? Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}