// ignore_for_file: avoid-returning-widgets

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class MatchDetailPage extends StatelessWidget {
  const MatchDetailPage({required this.match, super.key});
  final Match match;

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
              _buildTeamInfo(),
              const SizedBox(height: 20),
              _buildMatchDetails(),
              const SizedBox(height: 20),
              _buildAdditionalInfo(),
            ],
          ),
        ),
      );

  Widget _buildTeamInfo() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildTeamColumn(match.home)),
              Text(
                match.scores.score ?? "-",
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Expanded(child: _buildTeamColumn(match.away)),
            ],
          ),
        ],
      );

  Widget _buildTeamColumn(final ScoreAwayModel team) => Column(
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

  Widget _buildMatchDetails() => Column(
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

  Widget _buildAdditionalInfo() => Column(
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
