import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/member.dart';
import '../providers/profile_providers.dart';
import '../providers/profile_state.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          if (profileAsync.value?.mode == ProfileMode.editing)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Chip(
                  label: const Text('Editing'),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Couldn't load your profile", style: theme.textTheme.titleMedium),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(profileProvider),
                  child: const Text('Retry'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logout not implemented yet (auth pending)')),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
        data: (profileState) => profileState.mode == ProfileMode.view
            ? _buildView(context, profileState.member, theme)
            : _buildEditing(context, profileState, theme),
      ),
    );
  }

  Widget _buildView(BuildContext context, Member member, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: theme.colorScheme.secondaryContainer,
              child: Text(
                member.fullName.isNotEmpty ? member.fullName[0].toUpperCase() : '?',
                style: theme.textTheme.headlineMedium
                    ?.copyWith(color: theme.colorScheme.onSecondaryContainer),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(member.fullName, style: theme.textTheme.headlineSmall),
                const SizedBox(width: 8),
                if (member.isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text('Active',
                        style: theme.textTheme.labelSmall
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          _infoRow(theme, 'Email', member.email),
          _infoRow(theme, 'Phone Number', member.phoneNumber),
          _infoRow(theme, 'Registered', DateFormat('MMM d, yyyy').format(member.registeredDate)),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              _nameController.text = member.fullName;
              _phoneController.text = member.phoneNumber;
              ref.read(profileProvider.notifier).startEditing();
            },
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () async {
              await ref.read(logoutUseCaseProvider).call();
              if (context.mounted) context.go('/login');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(ThemeData theme, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: theme.textTheme.labelMedium
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          Text(value, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _buildEditing(BuildContext context, ProfileState profileState, ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            enabled: !profileState.isSaving,
            decoration: const InputDecoration(labelText: 'Full Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            enabled: !profileState.isSaving,
            decoration: const InputDecoration(labelText: 'Phone Number'),
          ),
          const SizedBox(height: 16),
          _readOnlyField(theme, 'Email', profileState.member.email),
          const SizedBox(height: 12),
          _readOnlyField(theme, 'Status', profileState.member.isActive ? 'Active' : 'Inactive'),
          if (profileState.editError != null) ...[
            const SizedBox(height: 12),
            Text(profileState.editError!,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error)),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: profileState.isSaving
                      ? null
                      : () => ref.read(profileProvider.notifier).cancelEditing(),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: profileState.isSaving
                      ? null
                      : () => ref.read(profileProvider.notifier).save(
                    fullName: _nameController.text,
                    phoneNumber: _phoneController.text,
                  ),
                  child: profileState.isSaving
                      ? const SizedBox(
                      width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _readOnlyField(ThemeData theme, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: theme.textTheme.labelSmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          Text(value, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}