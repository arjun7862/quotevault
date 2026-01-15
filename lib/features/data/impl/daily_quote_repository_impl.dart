
import 'package:quotevault/core/constants/constant_keys.dart';
import 'package:quotevault/core/utils/supabase_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositiory/daily_quote_repository.dart';
import '../models/quote_model.dart';

class DailyQuoteRepositoryImpl implements DailyQuoteRepository {


  @override
  Future<QuoteModel> getTodayQuote() async {
    final prefs = await SharedPreferences.getInstance();

    final todayKey =
    DateTime.now().toIso8601String().substring(0, 10);

    final storedDate =
    prefs.getString(ConstantKeys.dailyQuoteDate);
    final storedQuoteId =
    prefs.getString(ConstantKeys.dailyQuoteId);

    /// ✅ Same day → return cached quote
    if (storedDate == todayKey && storedQuoteId != null) {
      final res = await supabase
          .from('quotes')
          .select()
          .eq('id', storedQuoteId)
          .single();

      return QuoteModel.fromJson(res);
    }

    /// ✅ New day → fetch random quote via RPC
    final res = await supabase.rpc('random_quote');

    if (res == null || (res as List).isEmpty) {
      throw Exception('No quotes found');
    }

    final quoteJson = res.first;

    await prefs.setString(
      ConstantKeys.dailyQuoteDate,
      todayKey,
    );

    await prefs.setString(
      ConstantKeys.dailyQuoteId,
      quoteJson['id'],
    );

    return QuoteModel.fromJson(quoteJson);
  }
}