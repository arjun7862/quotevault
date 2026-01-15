import '../../../core/utils/supabase_client.dart';
import '../../domain/repositiory/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(String email, String password) async {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signup(String email, String password) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
