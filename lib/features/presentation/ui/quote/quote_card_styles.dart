import 'package:flutter/material.dart';
import 'package:quotevault/features/data/models/quote_model.dart';


enum QuoteCardStyle { classic, gradient, dark }

class QuoteCardStyles {
  static Widget build(QuoteCardStyle style, QuoteModel quote) {
    switch (style) {
      case QuoteCardStyle.gradient:
        return _gradient(quote);
      case QuoteCardStyle.dark:
        return _dark(quote);
      case QuoteCardStyle.classic:
      return _classic(quote);
    }
  }

  static Widget _base({
    required QuoteModel quote,
    required Decoration decoration,
    required Color textColor,
  }) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(24),
      decoration: decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '“${quote.text}”',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '— ${quote.author}',
            style: TextStyle(
              fontSize: 14,
              color: textColor.withValues(alpha: 0.8),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _classic(QuoteModel quote) {
    return _base(
      quote: quote,
      textColor: Colors.black,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static Widget _gradient(QuoteModel quote) {
    return _base(
      quote: quote,
      textColor: Colors.white,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.blue],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static Widget _dark(QuoteModel quote) {
    return _base(
      quote: quote,
      textColor: Colors.white,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
