import 'package:quotevault/features/data/models/quote_model.dart';

import '../../../core/utils/supabase_client.dart';
import '../../domain/repositiory/quotes_repository.dart';

class QuotesRepositoryImpl implements QuotesRepository {

  @override
  Future<List<QuoteModel>> fetchQuotes({
    required int page,
    required int limit,
    String? category,
    String? keyword,
    String? author,
  }) async {
    var query = supabase.from('quotes').select();

    if (category != null) query = query.eq('category', category);
    if (author != null && author.isNotEmpty) {
      query = query.ilike('author', '%$author%');
    }
    if (keyword != null && keyword.isNotEmpty) {
      query = query.ilike('text', '%$keyword%');
    }

    final res = await query
        .range(page * limit, (page + 1) * limit - 1);

    return (res as List)
        .map((e) => QuoteModel(
      id: e['id'].toString(),
      text: e['text'],
      author: e['author'],
      category: e['category'],
    ))
        .toList();
  }
}
