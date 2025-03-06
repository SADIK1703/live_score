import 'dart:async';

import 'package:live_score/core/_.export.dart';

enum HeadersEnum {
  authorization('Authorization');

  const HeadersEnum(this.name);

  final String name;
}

class RequestParams {
  RequestParams({
    required this.endPoint,
    this.requestBody,
    this.requestParams,
  });
  final Endpoints endPoint;
  final Map<String, dynamic>? requestBody;
  final Map<String, dynamic>? requestParams;

  Future<Map<String, dynamic>?> get headers async {
    final Map<String, dynamic> res = {};
    res[HeadersEnum.authorization.name] = RequestConstants().apiToken;
    return res;
  }
}
