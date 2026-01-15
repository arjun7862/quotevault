import '../../data/models/quote_model.dart';

abstract class DailyQuoteRepository {
  Future<QuoteModel> getTodayQuote();
}