import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:live_score/core/_.export.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class ScoresCubit extends Cubit<ScoresState> {
  ScoresCubit(this._scoresRepository) : super(const ScoresInitial());

  final ScoresRepository _scoresRepository;

  SortTypes? sortType;
  OrderTypes? orderType;

  Timer? timer;

  void reset() {
    timer?.cancel();
    sortType = null;
    orderType = null;
    emit(const ScoresInitial());
  }

  Future<void> changeFilter(final SortTypes? sortType, final OrderTypes? orderType) async {
    this.sortType = sortType;
    this.orderType = orderType;
  }

  void pause() {
    timer?.cancel();
  }

  Future<void> fetchScoresPeriodic() async {
    timer?.cancel();
    emit(const ScoresLoading());

    final result = await _scoresRepository.fetchScores(
      LatestLivescoresRequestModel(sortType: sortType, orderType: orderType),
    );

    emit(ScoresSuccess(result.data?.matches ?? []));

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (final _) async {
        final result = await _scoresRepository.fetchScores(
          LatestLivescoresRequestModel(sortType: sortType, orderType: orderType),
        );

        if (result is DataFailed) {
          emit(ScoresError(result.failure?.errorMessage ?? ''));
        } else {
          emit(ScoresSuccess(result.data?.matches ?? []));
        }
      },
    );

    if (result is DataFailed) {
      emit(ScoresError(result.failure?.errorMessage ?? ''));
    } else {
      emit(ScoresSuccess(result.data?.matches ?? []));
    }
  }
}
