import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import 'banner_area/banner_icon.dart';
import 'banner_area/banner_message.dart';
import 'banner_area/banner_action_button.dart';
import '../utils/shift_banner_utils.dart';

/// A persistent banner shown on the billing dashboard when no shift is active.
class ShiftWarningBanner extends StatelessWidget {
  const ShiftWarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, shiftState) {
        final shiftData = shiftState.data;
        if (shiftData != null && shiftData.currentSession != null) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: ShiftBannerUtils.getBannerDecoration(),
          child: Row(
            children: const [
              BannerIcon(),
              BannerMessage(
                message:
                    'Your shift hasn\'t started yet. Please start your shift timer to begin working.',
              ),
              BannerActionButton(),
            ],
          ),
        );
      },
    );
  }
}
