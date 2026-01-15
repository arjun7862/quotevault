import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_quotes_usecase.dart';
import 'quotes_event.dart';
import 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final GetQuotesUseCase getQuotes;

  int _page = 0;
  final int _limit = 20;
  String? _category;
  String? _keyword;
  String? _author;
  bool _hasMore = true;
  final List _allQuotes = [];

  QuotesBloc(this.getQuotes)
      : super(const QuotesState.initial()) {
    on<QuotesEvent>(_onEvent);
  }


  Future<void> _onEvent(
      QuotesEvent event,
      Emitter<QuotesState> emit,
      ) async {
    await event.map(
      fetch: (e) => _fetch(e.refresh ?? false, emit),
      changeCategory: (e) async {
        _category = e.category;
        _reset();
        await _fetch(true, emit);
      },
      search: (e) async {
        _keyword = e.keyword;
        _author = e.author;
        _reset();
        await _fetch(true, emit);
      },
    );
  }

  void _reset() {
    _page = 0;
    _allQuotes.clear();
    _hasMore = true;
  }

  Future<void> _fetch(bool refresh, Emitter emit) async {
    if (!_hasMore && !refresh) return;

    emit(const QuotesState.loading());

    try {
      final quotes = await getQuotes(
        page: _page,
        limit: _limit,
        category: _category,
        keyword: _keyword,
        author: _author,
      );

      if (quotes.isEmpty && _page == 0) {
        emit(const QuotesState.empty());
        return;
      }

      _allQuotes.addAll(quotes);
      _hasMore = quotes.length == _limit;
      _page++;

      emit(QuotesState.loaded(
        quotes: List.unmodifiable(_allQuotes),
        hasMore: _hasMore,
      ));
    } catch (e) {
      emit(QuotesState.error(e.toString()));
    }
  }
}
