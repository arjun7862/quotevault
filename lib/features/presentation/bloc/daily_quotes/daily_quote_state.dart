import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/quote_model.dart';
part 'daily_quote_state.freezed.dart';
@freezed
class DailyQuoteState with _$DailyQuoteState {
  const factory DailyQuoteState.loading() = DailyQuoteLoading;
  const factory DailyQuoteState.loaded(QuoteModel quote) = DailyQuoteLoaded;
}