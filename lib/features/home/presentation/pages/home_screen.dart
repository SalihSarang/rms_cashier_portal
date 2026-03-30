import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:cashier_portal/features/home/presentation/widgets/profile_header.dart';
import 'package:cashier_portal/features/home/presentation/widgets/shift_toggle_button.dart';
import 'package:cashier_portal/features/home/presentation/widgets/id_proof_view.dart';

class HomeScreen extends StatelessWidget {
  final StaffModel staff;

  const HomeScreen({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileHeader(staff: staff),
              const SizedBox(height: 32),
              IdProofView(idProofUrl: staff.idProof),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Cashier Dashboard',
        style: TextStyle(color: NeutralColors.white),
      ),
      backgroundColor: NeutralColors.glassBackground,
      actions: [
        ShiftToggleButton(staffId: staff.id),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.grey),
          tooltip: 'Logout',
          onPressed: () => context.read<AuthBloc>().add(SignOutEvent()),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
