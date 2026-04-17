import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/shift_models/shift_session.dart';
import 'package:rms_shared_package/utils/shift_utils.dart';

import '../../bloc/shift_bloc.dart';
import '../../bloc/shift_state.dart';

class ShiftHistorySection extends StatelessWidget {
  const ShiftHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final history =
        context.watch<ShiftBloc>().state.data?.history ??
        const <ShiftSession>[];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: NeutralColors.darkSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Shift History',
            style: TextStyle(
              color: TextColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (history.isEmpty)
            const Text(
              'No shift sessions yet.',
              style: TextStyle(color: TextColors.muted),
            ),
          for (final session in history.take(5))
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          session.dateKey,
                          style: const TextStyle(
                            color: TextColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ShiftUtils.formatSessionWindow(session),
                          style: const TextStyle(color: TextColors.muted),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    ShiftUtils.formatMinutes(session.workedMinutes),
                    style: const TextStyle(
                      color: TextColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
