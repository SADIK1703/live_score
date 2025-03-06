import 'package:live_score/core/_.export.dart';

enum HeadersEnum {
  apiKey('key'),
  apiSecret('secret');

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

  Map<String, dynamic> get headers {
    final Map<String, dynamic> res = {};
    res[HeadersEnum.apiKey.name] = RequestConstants().apiKey;
    res[HeadersEnum.apiSecret.name] = RequestConstants().apiSecret;
    return res;
  }
}
