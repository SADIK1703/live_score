import 'dart:async';

import 'package:live_score/core/_.export.dart';

typedef StreamFinishConditioner<T> = bool Function(
  int maxCount,
  T? data,
);

class StreamJob<T> {
  StreamJob({
    required this.job,
    required this.interval,
    required this.finishConditioner,
  });
  final Future<T> Function() job;
  final Duration interval;
  final StreamFinishConditioner<T> finishConditioner;
}

class StreamPeriodic {
  Stream<DataState<T?>> createJob<T>(final StreamJob<T> job) async* {
    final result = Stream<({T? data, int count})>.periodic(job.interval, (final count) {
      T? result;

      job.job().then((final value) => result = value);

      return (data: result, count: count);
    });

    await for (final element in result) {
      if (job.finishConditioner(element.count, element.data)) {
        break;
      }

      yield DataState.success(element.data);
    }
  }
}
