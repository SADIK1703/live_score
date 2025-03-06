enum MatchStatusses {
  live(['IN PLAY', 'ADDED TIME']),
  finished(['FINISHED']),
  halfTime(['HALF TIME BREAK']),
  notStarted(['']),
  ;

  const MatchStatusses(this.keys);

  final List<String> keys;

  static MatchStatusses fromKey(final String key) => MatchStatusses.values.firstWhere(
        (final status) => status.keys.contains(key),
        orElse: () => MatchStatusses.notStarted,
      );
}
