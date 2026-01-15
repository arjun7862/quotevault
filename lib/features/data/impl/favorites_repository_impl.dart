
import '../../../core/utils/supabase_client.dart';
import '../../domain/repositiory/favorites_repository.dart';
import '../models/quote_model.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {

  String get _userId {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    return user.id;
  }

  @override
  Future<void> toggleFavorite(QuoteModel quote) async {
    final existing = await supabase
        .from('favorites')
        .select('id')
        .eq('user_id', _userId)
        .eq('quote_id', quote.id)
        .maybeSingle();

    if (existing != null) {
      await supabase
          .from('favorites')
          .delete()
          .eq('id', existing['id']);
    } else {
      await supabase.from('favorites').insert({
        'user_id': _userId,
        'quote_id': quote.id,
      });
    }
  }

  @override
  Future<List<String>> getFavoriteQuoteIds() async {
    final res = await supabase
        .from('favorites')
        .select('quote_id')
        .eq('user_id', _userId);

    return (res as List)
        .map((e) => e['quote_id'] as String)
        .toList();
  }
}
