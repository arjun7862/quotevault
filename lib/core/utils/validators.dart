import '../constants/app_strings.dart';
import '../error/app_exception.dart';

class Validators {
   void validateEmail(String email) {
    if (email.isEmpty) {
      throw AppException(AppStrings.emailEmpty);
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(email)) {
      throw AppException(AppStrings.emailInvalid);
    }
  }

   void validatePassword(String password) {
    if (password.isEmpty) {
      throw AppException(AppStrings.passwordEmpty);
    }
    if (password.length < 6) {
      throw AppException(AppStrings.passwordShort);
    }
  }
}
