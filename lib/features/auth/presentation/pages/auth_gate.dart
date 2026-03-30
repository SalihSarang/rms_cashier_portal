import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'package:cashier_portal/features/home/presentation/pages/home_screen.dart';
import 'login_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    // Dispatch CheckAuthEvent when widget is first built to check persisted login
    context.read<AuthBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen(staff: state.user);
        }

        // Show full loading spinner ONLY during initial init state checking
        if (state is AuthInitial ||
            (state is AuthLoading && state.isInitialCheck)) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return const LoginPage();
      },
    );
  }
}
