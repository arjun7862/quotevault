import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/constants/app_strings.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    /// Stable callback (performance-safe)
    final onResetPressed = useCallback(() {
      context.read<AuthBloc>().add(
        AuthEvent.resetPasswordRequested(
          email: emailController.text.trim(),
        ),
      );
    }, [context, emailController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.resetPassword),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
        previous != current &&
            current.maybeWhen(
              success: () => true,
              orElse: () => false,
            ),
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(AppStrings.sendResetEmail),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: AppStrings.email,
                ),
              ),
              const SizedBox(height: 24),

              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) =>
                previous.runtimeType != current.runtimeType &&
                    current.maybeWhen(
                      loading: () => true,
                      failure: (_) => true,
                      orElse: () => true,
                    ),
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: state is AuthLoading ? null : onResetPressed,
                        child: SizedBox(
                          height: 20,
                          child: state is AuthLoading
                              ? const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                              : const Text(AppStrings.resetPassword),
                        ),
                      ),

                      const SizedBox(height: 8),
                      state.whenOrNull(
                        failure: (message) => Text(
                          message,
                          style:
                          const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ) ??
                          const SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
