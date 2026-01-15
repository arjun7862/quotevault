import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_event.freezed.dart';

@freezed
class QuotesEvent with _$QuotesEvent {
  const factory QuotesEvent.fetch({
    bool? refresh,
  }) = FetchQuotes;

  const factory QuotesEvent.changeCategory(String? category) =
  ChangeCategory;

  const factory QuotesEvent.search({
    String? keyword,
    String? author,
  }) = SearchQuotes;
}
