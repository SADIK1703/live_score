import 'package:live_score/product/_.export.dart';

class UnauthorizedError extends RequestError {
  UnauthorizedError() : super(message: 'The request is not authenticated.');
}
