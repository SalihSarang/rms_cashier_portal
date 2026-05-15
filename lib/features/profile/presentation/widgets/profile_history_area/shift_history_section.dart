import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/shift_models/shift_session.dart';
import '../../bloc/shift_bloc.dart';
import '../../bloc/shift_state.dart';
import 'history_section_header.dart';
import 'history_table.dart';

/// Right panel: recent shift history displayed as a clean table.
class ShiftHistorySection extends StatelessWidget {
  const ShiftHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final history =
        context.watch<ShiftBloc>().state.data?.history ??
        const <ShiftSession>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HistorySectionHeader(historyCount: history.length),
        const SizedBox(height: 12),
        HistoryTable(sessions: history),
      ],
    );
  }
}
