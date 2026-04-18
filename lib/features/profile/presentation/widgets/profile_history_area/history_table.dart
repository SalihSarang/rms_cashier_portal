import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/shift_models/shift_session.dart';
import 'history_table_cell.dart';
import 'history_row.dart';

/// A structured table for displaying recent shift sessions.
class HistoryTable extends StatelessWidget {
  final List<ShiftSession> sessions;

  const HistoryTable({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: NeutralColors.darkSurface,
          border: Border.all(color: NeutralColors.divider),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Table header
            Container(
              color: NeutralColors.surfaceLighter,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  HistoryHeaderCell('DATE', flex: 2),
                  HistoryHeaderCell('TIME', flex: 3),
                  HistoryHeaderCell('WORKED', flex: 1, align: TextAlign.right),
                ],
              ),
            ),

            // Empty state
            if (sessions.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text(
                    'No shift sessions yet.',
                    style: TextStyle(color: TextColors.muted, fontSize: 13),
                  ),
                ),
              ),

            // Data rows
            for (int i = 0; i < sessions.take(5).length; i++) ...[
              if (i > 0) const Divider(height: 1, color: NeutralColors.divider),
              HistoryRow(session: sessions[i]),
            ],
          ],
        ),
      ),
    );
  }
}
