import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotevault/core/utils/supabase_client.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/usecases/update_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfile;
  final UpdateProfileUseCase updateProfile;

  ProfileBloc({
    required this.getProfile,
    required this.updateProfile,
  }) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        load: (_) => _onLoad(emit),
        save: (e) => _onSave(e, emit),
      );
    });
  }

  Future<void> _onLoad(Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final user = supabase.auth.currentUser!;
      final profile = await getProfile(user.id);
      emit(ProfileState.loaded(profile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> _onSave(
      SaveProfile event,
      Emitter<ProfileState> emit,
      ) async {
    emit(const ProfileState.loading());

    try {
      final user = supabase.auth.currentUser!;

      final updatedProfile = await updateProfile(
        userId: user.id,
        name: event.name,
        avatarFile: event.avatarFile != null
            ? File(event.avatarFile!.path)
            : null,
      );

      emit(ProfileState.loaded(updatedProfile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }
}
