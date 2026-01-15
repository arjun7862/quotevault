import '../../data/models/quote_model.dart';

abstract class FavoritesRepository {
  Future<void> toggleFavorite(QuoteModel quote);
  Future<List<String>> getFavoriteQuoteIds();
}
