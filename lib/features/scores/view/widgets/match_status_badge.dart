import 'package:flutter/material.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class MatchStatusBadge extends StatelessWidget {
  const MatchStatusBadge({required this.status, super.key});
  final MatchStatusses status;

  @override
  Widget build(final BuildContext context) {
    Color bgColor;
    const Color textColor = CustomColors.white;
    IconData icon;
    String text;

    switch (status) {
      case MatchStatusses.notStarted:
        bgColor = CustomColors.blue;
        icon = Icons.access_time;
        text = "Başlamadı";
        break;
      case MatchStatusses.live:
        bgColor = CustomColors.red;
        icon = Icons.sensors;
        text = "Canlı";
        break;
      case MatchStatusses.halfTime:
        bgColor = CustomColors.orange;
        icon = Icons.pause_circle_filled;
        text = "Devre Arası";
        break;
      case MatchStatusses.finished:
        bgColor = CustomColors.green;
        icon = Icons.flag;
        text = "Bitti";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: bgColor.withAlpha(125),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
