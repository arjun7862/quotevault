import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/quote_model.dart';
import '../../bloc/collection/collections_bloc.dart';
import '../../bloc/favorites/favorites_bloc.dart';
import '../../bloc/favorites/favorites_event.dart';
import '../../bloc/favorites/favorites_state.dart';
import '../quote/quote_share_sheet.dart';
import 'add_to_collection_sheet.dart';

class QuoteListItem extends StatelessWidget {
  final QuoteModel quote;
  final void Function(QuoteModel quote)? onRemove;

  const QuoteListItem({
    super.key,
    required this.quote,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 6),
            Text(
              '— ${quote.author}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// ❤️ FAVORITE (performance safe)
                BlocSelector<FavoritesBloc, FavoritesState, bool>(
                  selector: (state) => state.maybeWhen(
                    loaded: (ids) => ids.contains(quote.id),
                    orElse: () => false,
                  ),
                  builder: (_, isFav) {
                    return IconButton(
                      icon: Icon(
                        isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      ),
                      onPressed: () => context
                          .read<FavoritesBloc>()
                          .add(FavoritesEvent.toggle(quote)),
                    );
                  },
                ),

                /// 📂 ADD TO COLLECTION
                IconButton(
                  icon: const Icon(Icons.collections_bookmark),
                  onPressed: () {
                    final collectionsBloc = context.read<CollectionsBloc>();

                    showModalBottomSheet(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: collectionsBloc,
                        child: AddToCollectionSheet(quote: quote),
                      ),
                    );
                  },
                ),

                /// 📤 SHARE
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) =>
                          QuoteShareSheet(quote: quote),
                    );
                  },
                ),

                /// ❌ REMOVE (collection detail only)
                if (onRemove != null)
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => onRemove!(quote),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}