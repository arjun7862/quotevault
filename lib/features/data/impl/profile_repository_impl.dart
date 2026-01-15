import 'dart:io';

import 'package:quotevault/features/data/models/user_profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/utils/supabase_client.dart';
import '../../domain/repositiory/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<UserProfileModel> fetchProfile(String userId) async {
    final res = await supabase
        .from('profiles')
        .select()
        .eq('user_id', userId)
        .maybeSingle();

    return UserProfileModel(
      userId: userId,
      name: res?['name'],
      avatarUrl: res?['avatar_url'],
    );
  }

  @override
  Future<void> upsertProfile(UserProfileModel profile) async {
    await supabase.from('profiles').upsert({
      'user_id': profile.userId,
      'name': profile.name,
      'avatar_url': profile.avatarUrl,
    });
  }

  @override
  Future<String> uploadAvatar(String userId, File file) async {
    final path = '$userId/avatar.png';

    await supabase.storage
        .from('avatars')
        .upload(
      path,
      file,
      fileOptions: const FileOptions(upsert: true),
    );

    return supabase.storage
        .from('avatars')
        .getPublicUrl(path);
  }
}
