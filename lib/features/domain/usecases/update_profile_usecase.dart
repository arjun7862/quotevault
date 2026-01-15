import 'dart:io';

import 'package:quotevault/features/data/models/user_profile_model.dart';

import '../repositiory/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<UserProfileModel> call({
    required String userId,
    required String name,
    File? avatarFile,
  }) async {
    String? avatarUrl;

    if (avatarFile != null) {
      avatarUrl = await repository.uploadAvatar(
        userId,
        avatarFile,
      );
    }

    final profile = UserProfileModel(
      userId: userId,
      name: name,
      avatarUrl: avatarUrl,
    );

    await repository.upsertProfile(profile);
    return profile;
  }
}
