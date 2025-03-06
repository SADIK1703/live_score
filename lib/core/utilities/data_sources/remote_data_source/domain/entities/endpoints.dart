import 'package:live_score/core/_.export.dart';

enum Endpoints {
  latestLivescores(path: "/matches/live.json", type: EndpointsType.get),
  allLeagues(path: "/leagues", type: EndpointsType.get),
  ;

  const Endpoints({required this.path, required this.type});

  final String path;
  final EndpointsType type;
}
