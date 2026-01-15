import 'dart:io';

import 'package:quotevault/features/data/models/user_profile_model.dart';

abstract class ProfileRepository {
  Future<UserProfileModel> fetchProfile(String userId);
  Future<void> upsertProfile(UserProfileModel profile);
  Future<String> uploadAvatar(String userId, File file);
}
