import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/collection_model.dart';
part 'collections_state.freezed.dart';
@freezed
class CollectionsState with _$CollectionsState {
  const factory CollectionsState.initial() = CollectionsInitial;
  const factory CollectionsState.loaded({
    required List<CollectionModel> collections,
  }) = CollectionsLoaded;
}