// ignore_for_file: avoid-returning-widgets

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/features/scores/view/widgets/match_status_badge.dart';
import 'package:live_score/product/_.export.dart';

class MatchItem extends StatefulWidget {
  const MatchItem({
    required this.team1,
    required this.team2,
    required this.matchTime,
    required this.time,
    required this.score,
    required this.status,
    super.key,
  });

  final ScoreAwayModel team1;
  final ScoreAwayModel team2;
  final DateTime matchTime;
  final String time;
  final ScoreScoresModel score;
  final MatchStatusses status;

  @override
  MatchItemState createState() => MatchItemState();
}

class MatchItemState extends State<MatchItem> {
  @override
  Widget build(final BuildContext context) {
    String scoreText = "-";
    Color scoreColor = CustomColors.black;

    if (widget.status != MatchStatusses.notStarted) {
      scoreText = widget.score.score ?? "-";
      if (widget.status == MatchStatusses.live) {
        scoreColor = CustomColors.red;
      }
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: CustomColors.grey.withAlpha(75),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildTeamColumn(widget.team1)),
                    Column(
                      children: [
                        MatchStatusBadge(status: widget.status),
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
                    Expanded(child: _buildTeamColumn(widget.team2)),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    DateFormat('dd MMM HH:mm').format(widget.matchTime),
                    style: const TextStyle(color: CustomColors.accentColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamColumn(final ScoreAwayModel team) => Column(
        children: [
          CachedNetworkImage(
            imageUrl: team.logo ?? '',
            width: 50,
            height: 50,
          ),
          Text(
            team.name ?? '',
            style: const TextStyle(
              fontSize: 12,
              color: CustomColors.accentColor,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      );
}
