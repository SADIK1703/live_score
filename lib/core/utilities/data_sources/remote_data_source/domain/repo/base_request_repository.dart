import 'package:live_score/core/_.export.dart';

abstract class IBaseRequest {
  Future<DataState<T>> request<T>({
    required final RequestParams requestParam,
    final ResponseParams<T>? responseParams,
  });
}
