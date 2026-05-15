import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/pages/profile_page.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String? avatarUrl;

        if (state is Authenticated) {
          avatarUrl = state.user.avatar;
        }

        return InkWell(
          onTap: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const ProfilePage())),
          borderRadius: BorderRadius.circular(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: NeutralColors.darkSurface,
                backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty
                    ? NetworkImage(avatarUrl)
                    : null,
                child: avatarUrl == null || avatarUrl.isEmpty
                    ? const Icon(
                        Icons.person,
                        color: TextColors.muted,
                        size: 20,
                      )
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
