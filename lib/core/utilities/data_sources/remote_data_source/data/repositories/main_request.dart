import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:live_score/core/_.export.dart';
import 'package:live_score/product/_.export.dart';

class MainRequestRepository implements IBaseRequest {
  CancelToken authFailureCancelToken = CancelToken();
  DateTime? lastCancelledDate;
  int cancelCoolOffSeconds = 5;

  @pragma('vm:invisible')
  @override
  Future<DataState<T>> request<T>({
    required final RequestParams requestParam,
    final ResponseParams<T>? responseParams,
  }) async {
    final String endPoint = requestParam.endPoint.path;
    final Map<String, dynamic> headers = requestParam.headers;
    final Map<String, dynamic> queryParameters = (requestParam.requestParams ?? {})..addAll(headers);
    try {
      final Response<String> response = await DependencyInjector.instance<Dio>().request<String>(
        endPoint,
        queryParameters: queryParameters,
        data: requestParam.requestBody,
        options: Options(
          method: requestParam.endPoint.type.name,
          responseType: ResponseType.json,
          contentType: "application/json",
          receiveDataWhenStatusError: true,
          validateStatus: (final _) => true,
        ),
      );

      DataState<T> state;
      if (response.statusCode != null && (response.statusCode ?? 404) >= 300) {
        state = _errorStatusConverter<T>(response.statusCode);
      } else {
        state = DataSuccess<T>(
          responseParams?.fromJson?.call(json.decode(response.data ?? "")) as T,
        );
      }
      return state;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return DataFailed(RequestError(message: 'Please check your internet connection and try again'));
      }
      if (e.response == null) {
        return DataFailed(RequestError());
      } else {
        final DataState<T> data = _errorStatusConverter<T>(e.response?.statusCode);
        return data;
      }
    } on Failure catch (failure) {
      return DataFailed(failure);
    } catch (e) {
      final DataFailed<T> exception = DataFailed<T>(RequestError(message: e.toString()));
      return exception;
    }
  }

  DataFailed<T> _errorStatusConverter<T>(final int? statusCode) {
    if (statusCode == 400) {
      return DataFailed<T>(BadRequestError());
    }
    if (statusCode == 401) {
      return DataFailed<T>(UnauthorizedError());
    }
    if (statusCode == 403) {
      return DataFailed<T>(ForbiddenError());
    }
    if (statusCode == 429) {
      return DataFailed<T>(TooManyRequestError());
    }
    if (statusCode == 500) {
      return DataFailed<T>(InternalServerError());
    } else {
      return DataFailed<T>(NotFoundError());
    }
  }
}
