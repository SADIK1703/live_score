import 'package:live_score/product/_.export.dart';

class BadRequestError extends RequestError {
  BadRequestError()
      : super( 
        message: 
          'It seems that some part of the request is malformed. The exact reason is returned in the response.',
        );
}
