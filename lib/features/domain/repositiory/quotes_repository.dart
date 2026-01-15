import 'package:quotevault/features/data/models/quote_model.dart';


abstract class QuotesRepository {
  Future<List<QuoteModel>> fetchQuotes({
    required int page,
    required int limit,
    String? category,
    String? keyword,
    String? author,
  });
}
