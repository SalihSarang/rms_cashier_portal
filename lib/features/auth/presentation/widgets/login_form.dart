import 'dart:ui';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<AuthBloc>().add(
      SignInEvent(_emailController.text, _passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                'Sign in to access your management dashboard.',
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
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: PrimaryColors.brandGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                          .withAlpha(128),
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
              const SizedBox(height: 20),
              const Divider(color: NeutralColors.glassBorder, height: 1),
              const SizedBox(height: 20),

              const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: NeutralColors.icon,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Need Help?',
                      style: TextStyle(color: NeutralColors.icon, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
