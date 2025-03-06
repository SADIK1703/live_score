import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class MatchItem extends StatefulWidget {
  const MatchItem({
    required this.match,
    super.key,
  });

  final MatchEntity match;

  @override
  MatchItemState createState() => MatchItemState();
}

class MatchItemState extends State<MatchItem> {
  @override
  Widget build(final BuildContext context) => Container(
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
                  TeamsInfoWidget(match: widget.match),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      DateFormat('dd MMM HH:mm').format(widget.match.startingAt),
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
