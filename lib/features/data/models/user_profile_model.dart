
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {

  const factory UserProfileModel({
    required String userId,
    String? name,
    String? avatarUrl,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);


  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
