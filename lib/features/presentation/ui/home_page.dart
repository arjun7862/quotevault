import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quotevault/features/presentation/ui/quote/quote_share_sheet.dart';
import 'package:quotevault/features/presentation/ui/widgets/add_to_collection_sheet.dart';
import 'package:quotevault/features/presentation/ui/widgets/app_drawer.dart';
import 'package:quotevault/features/presentation/ui/widgets/daily_quote_card.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/quote_category.dart';
import '../../data/models/quote_model.dart';
import '../bloc/favorites/favorites_bloc.dart';
import '../bloc/favorites/favorites_event.dart';
import '../bloc/favorites/favorites_state.dart';
import '../bloc/quotes/quotes_bloc.dart';
import '../bloc/quotes/quotes_event.dart';
import '../bloc/quotes/quotes_state.dart';
import 'widgets/category_chips.dart';
import 'widgets/quote_card.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  void _shareQuote(QuoteModel quote,BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => QuoteShareSheet(quote: quote),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final searchController = useTextEditingController();
    final authorController = useTextEditingController();

    final selectedCategory = useState<QuoteCategory?>(null);

    /// Initial load
    useEffect(() {
      context.read<QuotesBloc>().add(
        const QuotesEvent.fetch(),
      );
      return null;
    }, const []);

    /// Infinite scroll
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          context.read<QuotesBloc>().add(
            const QuotesEvent.fetch(),
          );
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    /// Search callback (keyword + author)
    final onSearch = useCallback(() {
      context.read<QuotesBloc>().add(
        QuotesEvent.search(
          keyword: searchController.text.trim(),
          author: authorController.text.trim(),
        ),
      );
    }, [context, searchController, authorController]);

    /// Category selection callback
    final onCategorySelected = useCallback(
          (QuoteCategory? category) {
        selectedCategory.value = category;
        context.read<QuotesBloc>().add(
            QuotesEvent.changeCategory(category?.dbValue)
        );
      },
      [context],
    );

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(AppStrings.home),
      ),
      body: Column(
        children: [

          DailyQuoteCard(),
          const SizedBox(height: 8),
          /// 🔍 Search section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: AppStrings.searchQuotes,
                    prefixIcon: Icon(Icons.search),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => onSearch(),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: authorController,
                  decoration: const InputDecoration(
                    hintText: AppStrings.searchByAuthor,
                    prefixIcon: Icon(Icons.person),
                  ),
                  onSubmitted: (_) => onSearch(),
                ),
              ],
            ),
          ),

          /// 🏷 Categories
          CategoryChips(
            selected: selectedCategory.value,
            onSelected: onCategorySelected,
          ),

          const SizedBox(height: 8),

          /// 📜 Quotes list
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<QuotesBloc>().add(
                  const QuotesEvent.fetch(refresh: true),
                );
              },
              child: BlocBuilder<QuotesBloc, QuotesState>(
                buildWhen: (previous, current) =>
                previous.runtimeType != current.runtimeType,
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    empty: () => const Center(
                      child: Text(AppStrings.noQuotes),
                    ),
                    error: (message) => Center(
                      child: Text(
                        message,
                        style:
                        const TextStyle(color: Colors.red),
                      ),
                    ),
                    loaded: (quotes, hasMore) {
                      return ListView.builder(
                        controller: scrollController,
                        itemCount:
                        quotes.length + (hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index >= quotes.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child:
                                CircularProgressIndicator(),
                              ),
                            );
                          }

                          final quote = quotes[index];

                          return BlocBuilder<FavoritesBloc, FavoritesState>(
                            builder: (context, favState) {
                              final isFav = favState.maybeWhen(
                                loaded: (ids) => ids.contains(quote.id),
                                orElse: () => false,
                              );
                              return InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) => AddToCollectionSheet(quote: quote),
                                  );
                                },
                                child: QuoteCard(
                                  key: ValueKey(quote.id),
                                  quote: quote,
                                  isFavorite: isFav,
                                  onFavorite: () {
                                    context
                                        .read<FavoritesBloc>()
                                        .add(FavoritesEvent.toggle(quote));
                                  },
                                  onShare: () => _shareQuote(quote,context),
                                ),
                              );
                            },
                          );

                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
