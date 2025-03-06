import 'package:live_score/product/_.export.dart';

class CountriesRepository {
  List fetchCountries() => countries.map((final e) => e['name']).toList();
}
