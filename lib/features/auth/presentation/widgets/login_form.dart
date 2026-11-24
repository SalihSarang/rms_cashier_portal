import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (DemoConfig.isDemoEmail(email)) {
      context.read<AuthBloc>().add(DemoSignInEvent());
    } else {
      context.read<AuthBloc>().add(SignInEvent(email, password));
    }
  }

  void _openDemoCredentialsDialog() {
    RmsDemoCredentialsDialog.show(
      context,
      currentPortalSpec: DemoConfig.cashier,
      initialSessionCode: DemoSessionManager.activeSessionId,
      onAutoFill: (email, password, sessionCode) {
        _emailController.text = email;
        _passwordController.text = password;
      },
      onAutoFillAndSignIn: (email, password, sessionCode) {
        _emailController.text = email;
        _passwordController.text = password;
        context.read<AuthBloc>().add(DemoSignInEvent(sessionCode: sessionCode));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: SemanticColors.error,
            ),
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: NeutralColors.glassBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: NeutralColors.glassBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: NeutralColors.authFieldBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: NeutralColors.glassBorder),
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      color: NeutralColors.icon,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to access your cashier dashboard.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: NeutralColors.icon, fontSize: 14),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hint: 'Enter your email address',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  isPassword: true,
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;
                    return ElevatedButton(
                      onPressed: isLoading ? null : _onSignIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColors.brandGreen,
                        foregroundColor: NeutralColors.authFieldBackground,
                        disabledBackgroundColor: PrimaryColors.brandGreen
                            .withValues(alpha: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: TextColors.primary,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  },
                ),
                RmsDemoCredentialsButton(
                  onPressed: _openDemoCredentialsDialog,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
