import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/utils/supabase_client.dart';
import '../../domain/repositiory/collections_repository.dart';
import '../models/collection_model.dart';
import '../models/quote_model.dart';

class CollectionsRepositoryImpl implements CollectionsRepository {


  String get _userId => supabase.auth.currentUser!.id;

  @override
  Future<List<CollectionModel>> getCollections() async {
    final res = await supabase
        .from('collections')
        .select()
        .eq('user_id', _userId);

    return (res as List)
        .map((e) => CollectionModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> createCollection(String name) async {
    await supabase.from('collections').insert({
      'user_id': _userId,
      'name': name,
    });
  }

  @override
  Future<void> addQuoteToCollection(
      String collectionId,
      QuoteModel quote,
      ) async {
    final res = await supabase.from('collection_quotes').insert({
      'collection_id': collectionId,
      'quote_id': quote.id,
    }).select();

    if (res.isEmpty) {
      throw Exception('Failed to add quote to collection');
    }
  }

  @override
  Future<void> removeQuoteFromCollection(
      String collectionId,
      QuoteModel quote,
      ) async {
    await supabase
        .from('collection_quotes')
        .delete()
        .eq('collection_id', collectionId)
        .eq('quote_id', quote.id);
  }
}