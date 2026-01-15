import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/models/quote_model.dart';
import 'collection_detail_event.dart';
import 'collection_detail_state.dart';


class CollectionDetailBloc
    extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  final SupabaseClient _client;

  CollectionDetailBloc(this._client)
      : super(const CollectionDetailState.loading()) {
    on<CollectionDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CollectionDetailEvent event,
      Emitter<CollectionDetailState> emit,
      ) async {
    await event.map(
      /// 🔹 LOAD QUOTES
      load: (e) async {
        emit(const CollectionDetailState.loading());

        try {
          if (e.collectionId == null) {
            final res = await _client
                .from('quotes')
                .select()
                .order('created_at', ascending: false);

            emit(
              CollectionDetailState.loaded(
                quotes: (res as List)
                    .map((q) => QuoteModel.fromJson(q))
                    .toList(),
              ),
            );
            return;
          }

          final collectionId = e.collectionId;
          if (collectionId == null) {
            emit(const CollectionDetailState.loaded(quotes: []));
            return;
          }

          final linkRes = await _client
              .from('collection_quotes')
              .select('quote_id')
              .eq('collection_id', collectionId);

          final quoteIds = (linkRes as List)
              .map((e) => e['quote_id'] as String)
              .toList();

          if (quoteIds.isEmpty) {
            emit(const CollectionDetailState.loaded(quotes: []));
            return;
          }

          final quotesRes = await _client
              .from('quotes')
              .select()
              .inFilter('id', quoteIds)
              .order('created_at', ascending: false);

          emit(
            CollectionDetailState.loaded(
              quotes: (quotesRes as List)
                  .map((q) => QuoteModel.fromJson(q))
                  .toList(),
            ),
          );
        } catch (e) {
          emit(const CollectionDetailState.loaded(quotes: []));
        }
      },

      /// 🔹 REMOVE QUOTE FROM COLLECTION
      removeQuote: (e) async {
        await _client
            .from('collection_quotes')
            .delete()
            .eq('collection_id', e.collectionId)
            .eq('quote_id', e.quote.id);

        // Reload same collection after removal
        add(CollectionDetailEvent.load(e.collectionId));
      },
    );
  }
}