import 'package:flutter/material.dart';
import 'package:quotevault/features/data/models/quote_model.dart';

import 'quote_card_styles.dart';


class QuoteCardPreview extends StatelessWidget {
  final QuoteModel quote;
  final QuoteCardStyle style;
  final GlobalKey repaintKey;

  const QuoteCardPreview({
    super.key,
    required this.quote,
    required this.style,
    required this.repaintKey,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: repaintKey,
      child: QuoteCardStyles.build(style, quote),
    );
  }
}
