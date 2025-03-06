import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:live_score/core/_.export.dart';

class DependencyInjector {
  static final instance = GetIt.instance;

  Future<void> initialize() async {
    instance
      ..registerFactory<Dio>(
        () {
          final dio = Dio(BaseOptions(baseUrl: RequestConstants().url));
          return dio;
        },
      )
      ..registerSingleton<IBaseRequest>(MainRequestRepository());
  }
}
