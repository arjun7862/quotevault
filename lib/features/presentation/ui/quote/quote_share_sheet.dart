import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quotevault/core/constants/app_strings.dart';
import 'package:quotevault/features/data/models/quote_model.dart';

import '../../../../core/utils/widget_to_image.dart';
import 'quote_card_styles.dart';

import 'quote_card_preview.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';



class QuoteShareSheet extends HookWidget {
  final QuoteModel quote;

  const QuoteShareSheet({
    super.key,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    final selectedStyle = useState(QuoteCardStyle.classic);
    final repaintKey = useMemoized(() => GlobalKey());
    final isProcessing = useState(false);

    final onShare = useCallback(() async {
      if (isProcessing.value) return;

      isProcessing.value = true;
      try {
        final bytes = await captureWidgetAsImage(repaintKey);

        final dir = await getTemporaryDirectory();
        final file = File(
          '${dir.path}/quote_${DateTime.now().millisecondsSinceEpoch}.png',
        );

        await file.writeAsBytes(bytes);
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(file.path)],
            text: '${AppStrings.quoteFrom}: ${quote.text} by ${quote.author}',
          ),
        );

        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        debugPrint('Share failed: $e');
      } finally {
        isProcessing.value = false;
      }
    }, []);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 🔥 LIVE PREVIEW
            QuoteCardPreview(
              quote: quote,
              style: selectedStyle.value,
              repaintKey: repaintKey,
            ),

            const SizedBox(height: 16),

            /// 🎨 STYLE SELECTOR
            Wrap(
              spacing: 8,
              children: QuoteCardStyle.values.map((style) {
                return ChoiceChip(
                  key: ValueKey(style),
                  label: Text(style.name),
                  selected: selectedStyle.value == style,
                  onSelected: (_) => selectedStyle.value = style,
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            /// 📤 SHARE / SAVE
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isProcessing.value ? null : onShare,
                child: isProcessing.value
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text(AppStrings.share),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

