enum SortTypes {
  leagueName('league_id', 'League Name'),

  countryName('name', 'Country Name'),

  startingAt('starting_at', 'Starting At'),
  ;

  const SortTypes(this.key, this.label);

  static String queryKey = 'sortBy';

  final String key;

  final String label;
}
