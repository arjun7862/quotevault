import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/quote_model.dart';
part 'collections_event.freezed.dart';
@freezed
class CollectionsEvent with _$CollectionsEvent {
  const factory CollectionsEvent.load() = LoadCollections;
  const factory CollectionsEvent.create(String name) = CreateCollection;
  const factory CollectionsEvent.addQuote({
    required String collectionId,
    required QuoteModel quote,
  }) = AddQuoteToCollection;

  const factory CollectionsEvent.removeQuote({
    required String collectionId,
    required QuoteModel quote,
  }) = RemoveQuoteFromCollection;
}