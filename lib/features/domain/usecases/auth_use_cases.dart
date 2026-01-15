import '../../../../core/utils/validators.dart';
import '../../../../core/error/app_exception.dart';
import '../../../core/constants/app_strings.dart';
import '../../domain/repositiory/auth_repository.dart';

class AuthUseCases {
  final AuthRepository repository;
  final validators = Validators();

  AuthUseCases(this.repository);

  Future<void> loginCall(String email, String password) async {
    validators.validateEmail(email);
    validators.validatePassword(password);

    try {
      await repository.login(email, password);
    } catch (_) {
      throw AppException(AppStrings.loginFailed);
    }
  }

  Future<void> signupCall(String email, String password) async {
    validators.validateEmail(email);
    validators.validatePassword(password);

    try {
      await repository.signup(email, password);
    } catch (_) {
      throw AppException(AppStrings.signupFailed);
    }
  }

  Future<void> resetPasswordCall(String email) async {
    validators.validateEmail(email);

    try {
      await repository.resetPassword(email);
    } catch (_) {
      throw AppException(AppStrings.resetFailed);
    }
  }

  Future<void> logoutCall() async {

    try {
      await repository.logout();
    } catch (_) {
      throw AppException(AppStrings.logoutFailed);
    }
  }
}
