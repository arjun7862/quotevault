import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/quote_model.dart';
part 'collection_detail_state.freezed.dart';
@freezed
class CollectionDetailState with _$CollectionDetailState {
  const factory CollectionDetailState.loading() =
  CollectionDetailLoading;

  const factory CollectionDetailState.loaded({
    required List<QuoteModel> quotes,
  }) = CollectionDetailLoaded;
}