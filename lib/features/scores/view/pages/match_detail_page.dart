import 'package:flutter/material.dart';
import 'package:live_score/features/scores/_.export.dart';

class MatchDetailPage extends StatelessWidget {
  const MatchDetailPage({required this.match, super.key});
  final MatchEntity match;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(match.competition?.name ?? 'Match Details'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamsInfoWidget(match: match),
              const SizedBox(height: 20),
              MatchDetailsWidget(match: match),
              const SizedBox(height: 20),
              MatchAdditionalInfoWidget(match: match),
            ],
          ),
        ),
      );
}
