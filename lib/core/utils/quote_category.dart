import '../../../../core/constants/app_strings.dart';

enum QuoteCategory {
  motivation,
  love,
  success,
  wisdom,
  humor,
}

extension QuoteCategoryX on QuoteCategory {
  String get label {
    switch (this) {
      case QuoteCategory.motivation:
        return AppStrings.categoryMotivation;
      case QuoteCategory.love:
        return AppStrings.categoryLove;
      case QuoteCategory.success:
        return AppStrings.categorySuccess;
      case QuoteCategory.wisdom:
        return AppStrings.categoryWisdom;
      case QuoteCategory.humor:
        return AppStrings.categoryHumor;
    }
  }

  /// 🔥 IMPORTANT: must match DB exactly
  String get dbValue {
    switch (this) {
      case QuoteCategory.motivation:
        return 'Motivation';
      case QuoteCategory.love:
        return 'Love';
      case QuoteCategory.success:
        return 'Success';
      case QuoteCategory.wisdom:
        return 'Wisdom';
      case QuoteCategory.humor:
        return 'Humor';
    }
  }
}

