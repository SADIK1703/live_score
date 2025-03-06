import 'package:live_score/features/scores/_.export.dart';

class Match {
  Match({
    required this.id,
    required this.home,
    required this.away,
    required this.status,
    required this.time,
    required this.scores,
    this.location,
    this.competition,
    this.country,
    this.lastChanged,
    this.added,
    this.scheduled,
  });

  final int? id;
  final ScoreCountryModel? country;
  final ScoreAwayModel home;
  final ScoreAwayModel away;
  final ScoreScoresModel scores;
  final MatchStatusses status;
  final String time;

  final DateTime? lastChanged;
  final DateTime? added;
  final String? scheduled;

  final String? location;
  final ScoreCompetitionModel? competition;

  DateTime get startingAt {
    final date = DateTime.now().toLocal();
    final time = (scheduled ?? '00:00').split(':').map(int.parse).toList();
    return DateTime(date.year, date.month, date.day, time.first, time.last);
  }
}
