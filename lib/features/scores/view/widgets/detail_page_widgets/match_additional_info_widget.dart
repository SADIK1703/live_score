import 'package:flutter/material.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class MatchAdditionalInfoWidget extends StatelessWidget {
  const MatchAdditionalInfoWidget({
    required this.match,
    super.key,
  });

  final MatchEntity match;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (match.location != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, color: CustomColors.red),
                const SizedBox(width: 4),
                Text(
                  match.location!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
          if (match.competition != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.emoji_events, color: CustomColors.orange),
                const SizedBox(width: 4),
                Text(
                  match.competition!.name ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ],
      );
}
