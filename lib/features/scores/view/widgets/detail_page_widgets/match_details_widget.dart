import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class MatchDetailsWidget extends StatelessWidget {
  const MatchDetailsWidget({required this.match, super.key});

  final MatchEntity match;

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          Text(
            DateFormat('dd MMM HH:mm').format(match.startingAt),
            style: const TextStyle(fontSize: 16, color: CustomColors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            match.status.toString().split('.').last.toUpperCase(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CustomColors.blue),
          ),
        ],
      );
}
