import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotevault/features/presentation/ui/widgets/quote_list_item.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../data/models/quote_model.dart';
import '../../bloc/quotes/quotes_bloc.dart';
import '../../bloc/quotes/quotes_state.dart';


class QuotesListView extends StatelessWidget {
  /// Used for Favorites screen
  final Set<String>? favoriteOnlyIds;

  /// Used for Collection Detail screen
  final List<QuoteModel>? quotesOverride;

  /// Show remove button (collection detail only)
  final void Function(QuoteModel quote)? onRemove;

  const QuotesListView({
    super.key,
    this.favoriteOnlyIds,
    this.quotesOverride,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 CASE 1: Quotes passed directly (Collection detail)
    if (quotesOverride != null) {
      return _QuotesList(
        quotes: quotesOverride!,
        onRemove: onRemove,
      );
    }

    // 🔹 CASE 2: Quotes from Bloc (Home / Favorites)
    return BlocBuilder<QuotesBloc, QuotesState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () =>
          const Center(child: CircularProgressIndicator()),

          loaded: (quotes,has) {
            final filtered = quotes.where((q) {
              if (favoriteOnlyIds != null &&
                  !favoriteOnlyIds!.contains(q.id)) {
                return false;
              }
              return true;
            }).toList();

            if (filtered.isEmpty) {
              return const Center(
                child: Text(AppStrings.noQuotesFound),
              );
            }

            return _QuotesList(
              quotes: filtered,
            );
          },

          error: (msg) => Center(child: Text(msg)),

          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _QuotesList extends StatelessWidget {
  final List<QuoteModel> quotes;
  final void Function(QuoteModel quote)? onRemove;

  const _QuotesList({
    required this.quotes,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (_, index) {
        final quote = quotes[index];
        return QuoteListItem(
          key: ValueKey(quote.id),
          quote: quote,
          onRemove: onRemove,
        );
      },
    );
  }
}