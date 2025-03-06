import 'package:flutter/widgets.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class TeamsInfoWidget extends StatelessWidget {
  const TeamsInfoWidget({
    required this.match,
    super.key,
  });

  final MatchEntity match;

  @override
  Widget build(final BuildContext context) {
    String scoreText = "-";
    Color scoreColor = CustomColors.black;

    if (match.status != MatchStatusses.notStarted) {
      scoreText = match.scores.score ?? "-";
      if (match.status == MatchStatusses.live) {
        scoreColor = CustomColors.red;
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: TeamInfoWidget(team: match.home)),
            Column(
              children: [
                MatchStatusBadge(status: match.status),
                const SizedBox(height: 6),
                Text(
                  scoreText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: scoreColor,
                  ),
                ),
              ],
            ),
            Expanded(child: TeamInfoWidget(team: match.away)),
          ],
        ),
      ],
    );
  }
}
