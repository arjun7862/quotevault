import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quotevault/features/data/models/user_profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded(UserProfileModel profile) = ProfileLoaded;
  const factory ProfileState.error(String message) = ProfileError;
}
