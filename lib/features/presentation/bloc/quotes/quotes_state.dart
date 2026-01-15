import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quotevault/features/data/models/quote_model.dart';

part 'quotes_state.freezed.dart';

@freezed
class QuotesState with _$QuotesState {
  const factory QuotesState.initial() = QuotesInitial;
  const factory QuotesState.loading() = QuotesLoading;
  const factory QuotesState.loaded({
    required List<QuoteModel> quotes,
    required bool hasMore,
  }) = QuotesLoaded;
  const factory QuotesState.empty() = QuotesEmpty;
  const factory QuotesState.error(String message) = QuotesError;
}
