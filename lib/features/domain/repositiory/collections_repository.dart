import '../../data/models/collection_model.dart';
import '../../data/models/quote_model.dart';

abstract class CollectionsRepository {
  Future<List<CollectionModel>> getCollections();
  Future<void> createCollection(String name);
  Future<void> addQuoteToCollection(String collectionId, QuoteModel quote);
  Future<void> removeQuoteFromCollection(String collectionId, QuoteModel quote);
}