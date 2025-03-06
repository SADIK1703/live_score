import 'package:live_score/core/_.export.dart';

enum Endpoints {
  latest(path: "/latest", type: EndpointsType.get),
  ;

  const Endpoints({required this.path, required this.type});

  final String path;
  final EndpointsType type;
}
