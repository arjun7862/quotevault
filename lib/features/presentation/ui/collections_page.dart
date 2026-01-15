import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotevault/features/presentation/ui/widgets/quotes_list_view.dart';

import '../../../core/constants/app_strings.dart';
import '../../data/models/quote_model.dart';
import '../bloc/collection/collections_bloc.dart';
import '../bloc/collection/collections_event.dart';
import '../bloc/collection/collections_state.dart';





import 'package:flutter_hooks/flutter_hooks.dart';

import '../collection_details/collection_detail_bloc.dart';
import '../collection_details/collection_detail_event.dart';
import '../collection_details/collection_detail_state.dart';

class CollectionsPage extends HookWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 🔹 Selected collection (null = ALL)
    final selectedCollectionId = useState<String?>(null);

    /// 🔹 Load ALL quotes on first build
    useEffect(() {
      context
          .read<CollectionDetailBloc>()
          .add(const CollectionDetailEvent.load(null));
      return null;
    }, const []);

    void onCollectionSelected(String? collectionId) {
      selectedCollectionId.value = collectionId;

      context
          .read<CollectionDetailBloc>()
          .add(CollectionDetailEvent.load(collectionId));
    }

    void showCreateCollectionDialog() {
      final controller = TextEditingController();

      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text(AppStrings.createCollection),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: AppStrings.collectionName,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // ✅ SAFE
                },
                child: const Text(AppStrings.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = controller.text.trim();
                  if (name.isEmpty) return;

                  context
                      .read<CollectionsBloc>()
                      .add(CollectionsEvent.create(name));

                  Navigator.pop(dialogContext); // ✅ SAFE
                },
                child: const Text(AppStrings.create),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.collections),
        leading: const BackButton(),
      ),

      body: Column(
        children: [
          /// 🟦 HORIZONTAL COLLECTION CHIPS
          BlocBuilder<CollectionsBloc, CollectionsState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (collections) {
                  return SizedBox(
                    height: 56,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        /// ALL QUOTES CHIP
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: const Text(AppStrings.all),
                            selected:
                            selectedCollectionId.value == null,
                            onSelected: (_) =>
                                onCollectionSelected(null),
                          ),
                        ),

                        /// USER COLLECTIONS
                        ...collections.map((collection) {
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                              label: Text(collection.name),
                              selected:
                              selectedCollectionId.value ==
                                  collection.id,
                              onSelected: (_) =>
                                  onCollectionSelected(collection.id),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),

          const Divider(height: 1),

          /// 🟦 QUOTES LIST
          Expanded(
            child: BlocBuilder<CollectionDetailBloc,
                CollectionDetailState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (List<QuoteModel> quotes) {
                    if (quotes.isEmpty) {
                      return const Center(
                        child: Text(AppStrings.noQuotesFound),
                      );
                    }

                    return QuotesListView(
                      quotesOverride: quotes,

                      /// ❌ Remove allowed only when a collection is selected
                      onRemove: selectedCollectionId.value == null
                          ? null
                          : (quote) {
                        context
                            .read<CollectionDetailBloc>()
                            .add(
                          CollectionDetailEvent.removeQuote(
                            collectionId:
                            selectedCollectionId.value!,
                            quote: quote,
                          ),
                        );
                      },
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),

      /// ➕ CREATE COLLECTION
      floatingActionButton: FloatingActionButton(
        onPressed: showCreateCollectionDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}