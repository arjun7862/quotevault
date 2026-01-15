import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';

part 'quote_model.g.dart';

@freezed
class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    required String id,
    required String text,
    required String author,
    required String category,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


