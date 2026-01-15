import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../data/models/quote_model.dart';
import '../../bloc/collection/collections_bloc.dart';
import 'add_to_collection_sheet.dart';

class QuoteCard extends HookWidget {
  final QuoteModel quote;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;
  final bool isFavorite;

  const QuoteCard({
    super.key,
    required this.quote,
    this.onFavorite,
    this.onShare,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RepaintBoundary(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: theme.colorScheme.surfaceVariant.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Quote text
              Text(
                '“${quote.text}”',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),

              /// Author + actions
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '- ${quote.author}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                  /// Favorite
                  IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite
                          ? theme.colorScheme.primary
                          : theme.iconTheme.color,
                    ),
                    onPressed: onFavorite,
                    tooltip: AppStrings.favorites,
                  ),

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

                  /// Share
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: onShare,
                    tooltip: AppStrings.share,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
