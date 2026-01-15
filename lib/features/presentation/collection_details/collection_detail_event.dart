import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/quote_model.dart';
part 'collection_detail_event.freezed.dart';
@freezed
class CollectionDetailEvent with _$CollectionDetailEvent {
  /// Load ALL quotes (collectionId == null)
  const factory CollectionDetailEvent.load(String? collectionId) =
  LoadCollectionQuotes;

  /// Remove quote from selected collection
  const factory CollectionDetailEvent.removeQuote({
    required String collectionId,
    required QuoteModel quote,
  }) = RemoveQuoteFromCollection;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}