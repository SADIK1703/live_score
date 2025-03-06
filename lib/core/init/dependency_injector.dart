import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:live_score/core/_.export.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DependencyInjector {
  static final instance = GetIt.instance;

  Future<void> initialize() async {
    instance
      ..registerFactory<Dio>(
        () {
          final dio = Dio(BaseOptions(baseUrl: RequestConstants().url))..interceptors.add(PrettyDioLogger());
          return dio;
        },
      )
      ..registerSingleton<IBaseRequest>(MainRequestRepository())
      ..registerLazySingleton<ScoresRepository>(() => ScoresRepository(instance<IBaseRequest>()))
      ..registerLazySingleton<ScoresCubit>(() => ScoresCubit(instance<ScoresRepository>()));
  }
}
