import 'package:quotevault/features/data/models/user_profile_model.dart';

import '../repositiory/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<UserProfileModel> call(String userId) {
    return repository.fetchProfile(userId);
  }
}
