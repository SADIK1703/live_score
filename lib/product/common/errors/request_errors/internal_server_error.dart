import 'package:live_score/product/_.export.dart';

class InternalServerError extends RequestError {
  InternalServerError()
      : super(
          message:
              "An internal error has occurred and has been logged for further inspection. Please email support if you are receiving this error.",
        );
}
