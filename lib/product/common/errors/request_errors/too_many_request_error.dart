import 'package:live_score/product/_.export.dart';

class TooManyRequestError extends RequestError {
  TooManyRequestError()
      : super(
          message:
              "Too many requests. In order to make the API as responsive as possible, you have an hourly request limit.",
        );
}
