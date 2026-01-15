import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';

class SignupPage extends HookWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Stable callback (prevents unnecessary rebuilds)
    final onSignupPressed = useCallback(() {
      context.read<AuthBloc>().add(
        AuthEvent.signupRequested(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    }, [
      context,
      emailController,
      passwordController,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signup),
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
            success: () => context.go('/home'),
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
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: AppStrings.password,
                ),
              ),
              const SizedBox(height: 24),

              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) =>
                previous.runtimeType != current.runtimeType &&
                    current.maybeWhen(
                      loading: () => true,
                      failure: (_) => true,
                      orElse: () => false,
                    ),
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: state.maybeWhen(
                          loading: () => null,
                          orElse: () => onSignupPressed,
                        ),
                        child: state.when(
                          initial: () =>
                          const Text(AppStrings.createAccount),
                          loading: () =>
                          const CircularProgressIndicator(),
                          success: () =>
                          const Text(AppStrings.createAccount),
                          failure: (_) =>
                          const Text(AppStrings.createAccount),
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
