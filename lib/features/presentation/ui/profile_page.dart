import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_strings.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/profile/profile_event.dart';
import '../bloc/profile/profile_state.dart';


class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final pickedImage = useState<XFile?>(null);

    /// Load profile once
    useEffect(() {
      context.read<ProfileBloc>().add(const ProfileEvent.load());
      return null;
    }, const []);

    /// Pick image
    final pickImage = useCallback(() async {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        pickedImage.value = image;
      }
    }, []);

    /// Save profile
    final onSavePressed = useCallback(() {
      context.read<ProfileBloc>().add(
        ProfileEvent.save(
          name: nameController.text.trim(),
          avatarFile: pickedImage.value,
        ),
      );
    }, [nameController, pickedImage]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.profile),
      ),

      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (profile) {
              nameController.text = profile.name ?? '';
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppStrings.profileUpdated)),
              );
            },
            error: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppStrings.updateFailed)),
              );
            },
          );
        },

        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              loaded: (profile) {
                final avatarProvider = pickedImage.value != null
                    ? FileImage(File(pickedImage.value!.path))
                    : (profile.avatarUrl != null
                    ? NetworkImage(profile.avatarUrl!)
                    : null);

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: avatarProvider as ImageProvider?,
                          child: avatarProvider == null
                              ? const Icon(Icons.person, size: 40)
                              : null,
                        ),
                      ),
                      const SizedBox(height: 24),

                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: AppStrings.name,
                        ),
                      ),
                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: onSavePressed,
                        child: const Text(AppStrings.save),
                      ),
                    ],
                  ),
                );
              },
              error: (msg) => Center(
                child: Text(msg, style: const TextStyle(color: Colors.red)),
              ),
            );
          },
        ),
      ),
    );
  }
}
