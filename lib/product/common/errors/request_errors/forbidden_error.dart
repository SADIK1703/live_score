import 'package:live_score/product/_.export.dart';

class ForbiddenError extends RequestError {
  ForbiddenError()
      : super(
          message:
              "Not authorized. Indicates you're attempting to access a feed that is not accessible from your plan.",
        );
}
