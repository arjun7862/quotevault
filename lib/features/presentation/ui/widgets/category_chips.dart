import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/quote_category.dart';


class CategoryChips extends HookWidget {
  final QuoteCategory? selected;
  final ValueChanged<QuoteCategory?> onSelected;

  const CategoryChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    /// Stable callback
    final onChipSelected = useCallback(
          (QuoteCategory category) {
        if (category == selected) {
          onSelected(null); // deselect
        } else {
          onSelected(category);
        }
      },
      [selected, onSelected],
    );

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: QuoteCategory.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = QuoteCategory.values[index];
          final isSelected = category == selected;

          return ChoiceChip(
            key: ValueKey(category.name),
            label: Text(category.label),
            selected: isSelected,
            onSelected: (_) => onChipSelected(category),
            selectedColor:
            theme.colorScheme.primary.withValues(alpha: 0.2),
            labelStyle: theme.textTheme.labelMedium?.copyWith(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
              fontWeight:
              isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }
}
