import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_quote_event.freezed.dart';
@freezed
class DailyQuoteEvent with _$DailyQuoteEvent {
  const factory DailyQuoteEvent.load() = LoadDailyQuote;
}