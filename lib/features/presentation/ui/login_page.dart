import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:quotevault/core/constants/app_strings.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Optimized callback (stable reference)
    final onLoginPressed = useCallback(() {
      context.read<AuthBloc>().add(
        AuthEvent.loginRequested(
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
        title: const Text(AppStrings.login),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
        previous != current && current.maybeWhen(
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
                decoration: const InputDecoration(
                  labelText: AppStrings.email,
                ),
                keyboardType: TextInputType.emailAddress,
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

              /// Button + loading/error handling
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
                        onPressed: state.maybeWhen(
                          loading: () => null,
                          orElse: () => onLoginPressed,
                        ),
                        child: state.when(
                          initial: () =>
                          const Text(AppStrings.login),
                          loading: () =>
                          const CircularProgressIndicator(),
                          success: () =>
                          const Text(AppStrings.login),
                          failure: (_) =>
                          const Text(AppStrings.login),
                        ),
                      ),
                      const SizedBox(height: 8),
                      state.whenOrNull(
                        failure: (message) => Text(
                          message,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ) ??
                          const SizedBox.shrink(),
                    ],
                  );
                },
              ),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.push('/reset'),
                child: const Text(AppStrings.forgotPassword),
              ),
              TextButton(
                onPressed: () => context.push('/signup'),
                child: const Text(AppStrings.createAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
