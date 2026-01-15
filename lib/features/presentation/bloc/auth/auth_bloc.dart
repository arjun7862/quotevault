import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/auth_use_cases.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases authUseCases;

  AuthBloc({
    required this.authUseCases,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AuthEvent event,
      Emitter<AuthState> emit,
      ) async {
    await event.map(
      loginRequested: (e) => _login(e, emit),
      signupRequested: (e) => _signup(e, emit),
      resetPasswordRequested: (e) => _reset(e, emit),
      logoutRequested: (_) => _logout(emit),
    );
  }

  Future<void> _login(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(const AuthState.loading());
    try {
      await authUseCases.loginCall(event.email, event.password);
      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _signup(
      SignupRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(const AuthState.loading());
    try {
      await authUseCases.signupCall(event.email, event.password);
      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _reset(
      ResetPasswordRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(const AuthState.loading());
    try {
      await authUseCases.resetPasswordCall(event.email);
      emit(const AuthState.success());
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }

  Future<void> _logout(
      Emitter<AuthState> emit,
      ) async {
    emit(const AuthState.loading());
    try {
      await authUseCases.logoutCall();
      emit(const AuthState.initial());
    } catch (e) {
      emit(AuthState.failure(message: e.toString()));
    }
  }
}
