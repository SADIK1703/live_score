import 'package:live_score/core/_.export.dart';

class RequestError extends Failure {
  RequestError({final String message = "An error occurred while processing your request."}) : super(message);
}
