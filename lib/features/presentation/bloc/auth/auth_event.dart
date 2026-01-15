import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;

  const factory AuthEvent.signupRequested({
    required String email,
    required String password,
  }) = SignupRequested;

  const factory AuthEvent.resetPasswordRequested({
    required String email,
  }) = ResetPasswordRequested;

  const factory AuthEvent.logoutRequested() = LogoutRequested;
}
