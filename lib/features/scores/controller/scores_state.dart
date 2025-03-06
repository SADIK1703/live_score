import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_score/features/scores/_.export.dart';

@freezed
sealed class ScoresState {
  const ScoresState();
}

final class ScoresInitial extends ScoresState {
  const ScoresInitial();
}

final class ScoresLoading extends ScoresState {
  const ScoresLoading();
}

final class ScoresSuccess extends ScoresState {
  const ScoresSuccess(this.matches);

  final List<MatchEntity> matches;
}

final class ScoresEmpty extends ScoresState {
  const ScoresEmpty();
}

final class ScoresError extends ScoresState {
  const ScoresError(this.message);

  final String message;
}
