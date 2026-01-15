import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = LoadProfile;

  const factory ProfileEvent.save({
    required String name,
    XFile? avatarFile,
  }) = SaveProfile;
}
