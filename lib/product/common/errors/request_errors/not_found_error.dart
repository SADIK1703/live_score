import 'package:live_score/product/_.export.dart';

class NotFoundError extends RequestError {
  NotFoundError()
      : super(
          message: "The requested resource could not be found. Please check the URL and try again.",
        );
}
