import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import '../primary_text.dart';
import '../muted_text.dart';
import 'profile_hero_avatar.dart';
import '../dashboard_divider.dart';

/// Left sidebar hero block: large avatar, name, and role label.
class ProfileHeroSection extends StatelessWidget {
  const ProfileHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) return const SizedBox.shrink();
        final user = state.user;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileHeroAvatar(avatarUrl: user.avatar, name: user.name),
            PrimaryText.large(user.name, align: TextAlign.center),
            MutedText.body(user.role.name.toUpperCase(), topPadding: 6),
            const DashboardDivider(topSpacing: 28),
          ],
        );
      },
    );
  }
}
