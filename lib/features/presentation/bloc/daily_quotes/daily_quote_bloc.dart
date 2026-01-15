
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositiory/daily_quote_repository.dart';
import 'daily_quote_event.dart';
import 'daily_quote_state.dart';

class DailyQuoteBloc
    extends Bloc<DailyQuoteEvent, DailyQuoteState> {
  final DailyQuoteRepository repository;

  DailyQuoteBloc(this.repository)
      : super(const DailyQuoteState.loading()) {
    on<DailyQuoteEvent>((event, emit) async {
      final quote = await repository.getTodayQuote();
      emit(DailyQuoteState.loaded(quote));
    });
  }
}