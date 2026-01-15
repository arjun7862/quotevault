import 'package:quotevault/features/data/models/quote_model.dart';
import '../repositiory/quotes_repository.dart';

class GetQuotesUseCase {
  final QuotesRepository repository;

  GetQuotesUseCase(this.repository);

  Future<List<QuoteModel>> call({
    required int page,
    required int limit,
    String? category,
    String? keyword,
    String? author,
  }) {
    return repository.fetchQuotes(
      page: page,
      limit: limit,
      category: category,
      keyword: keyword,
      author: author,
    );
  }
}
