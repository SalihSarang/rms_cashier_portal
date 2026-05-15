import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/shift_models/shift_session.dart';
import 'package:rms_shared_package/utils/shift_utils.dart';
import 'history_data_cell.dart';

/// A single data row in the Shift History Table.
class HistoryRow extends StatelessWidget {
  final ShiftSession session;

  const HistoryRow({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          HistoryDataCell(
            session.dateKey,
            flex: 2,
            fontWeight: FontWeight.w600,
          ),
          HistoryDataCell(
            ShiftUtils.formatSessionWindow(session),
            flex: 3,
            color: TextColors.muted,
          ),
          HistoryDataCell(
            ShiftUtils.formatMinutes(session.workedMinutes),
            flex: 1,
            align: TextAlign.right,
            color: PrimaryColors.brandGreen,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
