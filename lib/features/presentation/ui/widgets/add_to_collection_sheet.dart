import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/quote_model.dart';
import '../../bloc/collection/collections_bloc.dart';
import '../../bloc/collection/collections_event.dart';
import '../../bloc/collection/collections_state.dart';

class AddToCollectionSheet extends StatelessWidget {
  final QuoteModel quote;

  const AddToCollectionSheet({
    super.key,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsBloc, CollectionsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (collections) => ListView(
            children: collections.map((c) {
              return ListTile(
                title: Text(c.name),
                trailing: const Icon(Icons.add),
                onTap: () {
                  context.read<CollectionsBloc>().add(
                    CollectionsEvent.addQuote(
                      collectionId: c.id,
                      quote: quote,
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
          orElse: () =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}