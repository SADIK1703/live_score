class ResponseParams<T> {
  ResponseParams({this.fromJson, this.fromRawData});
  final T Function(Map<String, dynamic>)? fromJson;
  final T Function(String?)? fromRawData;
}
