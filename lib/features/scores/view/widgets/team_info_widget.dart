import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:live_score/features/scores/_.export.dart';

class TeamInfoWidget extends StatelessWidget {
  const TeamInfoWidget({
    required this.team,
    super.key,
  });

  final ScoreAwayModel team;

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          CachedNetworkImage(
            imageUrl: team.logo ?? '',
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 8),
          Text(
            team.name ?? 'Unknown',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
