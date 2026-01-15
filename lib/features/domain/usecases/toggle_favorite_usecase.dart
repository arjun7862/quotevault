import '../../data/models/quote_model.dart';
import '../repositiory/favorites_repository.dart';


class ToggleFavoriteUseCase {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase(this.repository);

  Future<void> call(QuoteModel quote) {
    return repository.toggleFavorite(quote);
  }
}
