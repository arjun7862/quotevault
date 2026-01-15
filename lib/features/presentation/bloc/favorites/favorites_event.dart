import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quotevault/features/data/models/quote_model.dart';

part 'favorites_event.freezed.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.load() = LoadFavorites;
  const factory FavoritesEvent.toggle(QuoteModel quote) = ToggleFavorite;
}
