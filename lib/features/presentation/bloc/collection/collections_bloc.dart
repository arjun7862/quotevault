import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositiory/collections_repository.dart';
import 'collections_event.dart';
import 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepository repository;

  CollectionsBloc(this.repository)
      : super(const CollectionsState.initial()) {
    on<CollectionsEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CollectionsEvent event,
      Emitter<CollectionsState> emit,
      ) async {
    await event.map(
      /// 🔹 LOAD COLLECTIONS
      load: (_) async {
        try {
          final data = await repository.getCollections();
          emit(CollectionsState.loaded(collections: data));
        } catch (e) {
          // Optional: you can add an error state later
          emit(const CollectionsState.loaded(collections: []));
        }
      },

      /// 🔹 CREATE COLLECTION
      create: (e) async {
        await repository.createCollection(e.name);

        // Reload collections so UI updates immediately
        final data = await repository.getCollections();
        emit(CollectionsState.loaded(collections: data));
      },

      /// 🔹 ADD QUOTE TO COLLECTION
      addQuote: (e) async {
        await repository.addQuoteToCollection(
          e.collectionId,
          e.quote,
        );

        // Collections list usually doesn't change,
        // but reloading keeps state consistent
        final data = await repository.getCollections();
        emit(CollectionsState.loaded(collections: data));
      },

      /// 🔹 REMOVE QUOTE FROM COLLECTION
      removeQuote: (e) async {
        await repository.removeQuoteFromCollection(
          e.collectionId,
          e.quote,
        );

        final data = await repository.getCollections();
        emit(CollectionsState.loaded(collections: data));
      },
    );
  }
}