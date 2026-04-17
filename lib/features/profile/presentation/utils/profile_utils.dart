import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_event.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class ProfileUtils {
  /// Formats a DateTime into a HH:mm string format.
  static String formatShiftTime(DateTime? time) {
    return ShiftUtils.formatTime(time);
  }

  /// Handles starting the shift.
  static void handleStartShift(BuildContext context, StaffModel staff) {
    context.read<ShiftBloc>().add(StartShiftEvent(staff));
  }

  /// Handles the end shift logic.
  static void handleEndShift(BuildContext context, String staffId) {
    context.read<ShiftBloc>().add(EndShiftEvent(staffId));
  }

  /// Handles pausing the shift.
  static void handlePauseShift(BuildContext context, String staffId) {
    context.read<ShiftBloc>().add(PauseShiftEvent(staffId));
  }

  /// Handles resuming the shift.
  static void handleResumeShift(BuildContext context, String staffId) {
    context.read<ShiftBloc>().add(ResumeShiftEvent(staffId));
  }

  /// Handles the global logout flow.
  static void handleLogout(BuildContext context) {
    context.read<AuthBloc>().add(SignOutEvent());
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
