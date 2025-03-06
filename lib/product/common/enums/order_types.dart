enum OrderTypes {
  asc('asc', 'Ascending'),
  desc('desc', 'Descending'),
  ;

  const OrderTypes(this.key, this.label);

  static String queryKey = 'order';

  static OrderTypes defaultOrder = OrderTypes.asc;

  final String key;

  final String label;
}
