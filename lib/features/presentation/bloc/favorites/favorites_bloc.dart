import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_favorites_usecase.dart';
import '../../../domain/usecases/toggle_favorite_usecase.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUseCase getFavorites;
  final ToggleFavoriteUseCase toggleFavorite;

  FavoritesBloc({
    required this.getFavorites,
    required this.toggleFavorite,
  }) : super(const FavoritesState.initial()) {
    on<LoadFavorites>(_onLoad);
    on<ToggleFavorite>(_onToggle);
  }

  Future<void> _onLoad(
      LoadFavorites event,
      Emitter<FavoritesState> emit,
      ) async {
    final ids = await getFavorites();
    emit(FavoritesState.loaded(
      favoriteIds: ids.toSet(),
    ));
  }

  Future<void> _onToggle(
      ToggleFavorite event,
      Emitter<FavoritesState> emit,
      ) async {
    await toggleFavorite(event.quote);
    final ids = await getFavorites();
    emit(FavoritesState.loaded(
      favoriteIds: ids.toSet(),
    ));
  }
}
