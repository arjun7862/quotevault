import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotevault/features/presentation/ui/widgets/quotes_list_view.dart';

import '../../../core/constants/app_strings.dart';
import '../bloc/favorites/favorites_bloc.dart';
import '../bloc/favorites/favorites_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.favorites),
        leading: const BackButton(),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (favoriteIds) {
              if (favoriteIds.isEmpty) {
                return const Center(
                  child: Text(AppStrings.noFavorites),
                );
              }

              return QuotesListView(
                favoriteOnlyIds: favoriteIds,
              );
            },
            orElse: () =>
            const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}