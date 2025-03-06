enum MatchStatusses {
  live('IN PLAY'),
  finished('FINISHED'),
  halfTime('HALF TIME BREAK'),
  notStarted(''),
  ;

  const MatchStatusses(this.key);

  final String key;

  static MatchStatusses fromKey(final String key) => MatchStatusses.values.firstWhere(
        (final status) => status.key == key,
        orElse: () => MatchStatusses.notStarted,
      );
}
