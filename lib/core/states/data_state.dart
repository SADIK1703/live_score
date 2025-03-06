import 'dart:async';

import 'package:live_score/core/_.export.dart';

abstract class DataState<T> {
  factory DataState.success(final T data) => DataSuccess<T>(data);

  factory DataState.error(final Failure failure) => DataFailed<T>(failure);
  abstract final Failure? failure;
  abstract final T? data;

  FutureOr<DataState<K>> when<K>({
    final FutureOr<DataState<K>> Function(T data)? success,
    final FutureOr<DataState<K>> Function(Failure failure)? error,
  });
}

class DataSuccess<T> implements DataState<T> {
  DataSuccess(this.data);
  @override
  final Failure? failure = null;

  @override
  final T data;

  @override
  FutureOr<DataState<K>> when<K>({
    final FutureOr<DataState<K>> Function(T data)? success,
    final FutureOr<DataState<K>> Function(Failure failure)? error,
  }) =>
      success?.call(data) ?? DataSuccess(data as K);
}

class DataFailed<T> extends Error implements DataState<T> {
  DataFailed(this.failure);
  @override
  final Failure failure;

  @override
  final T? data = null;

  @override
  FutureOr<DataState<K>> when<K>({
    final FutureOr<DataState<K>> Function(T data)? success,
    final FutureOr<DataState<K>> Function(Failure failure)? error,
  }) =>
      error?.call(failure) ?? DataFailed(failure);
}
