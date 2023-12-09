part of 'statistics_bloc.dart';

@freezed
class StatisticsState with _$StatisticsState{
  const StatisticsState._();

  const factory StatisticsState.idle() = _IdleState;

  const factory StatisticsState.loading() = _LoadingState;

  const factory StatisticsState.success({
    required StatisticsResponse statistics,
  }) = _SuccessState;

  const factory StatisticsState.error() = _ErrorState;
}
