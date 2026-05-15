import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../bloc/shift_bloc.dart';
import '../bloc/shift_state.dart';
import '../widgets/profile_app_bar_area/profile_app_bar.dart';
import '../widgets/profile_body.dart';
import '../utils/profile_utils.dart';

/// Profile Page — declarative two-column web layout.
///
/// This file acts as the "Table of Contents" for the entire screen structure.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftBloc, ShiftState>(
      listener: (context, state) {
        if (state is ShiftError) ProfileUtils.showError(context, state.message);
      },
      child: const Scaffold(
        backgroundColor: NeutralColors.darkBackground,
        appBar: ProfileAppBar(),
        body: ProfileBody(),
      ),
    );
  }
}
