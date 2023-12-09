part of 'statistics_bloc.dart';

@freezed
class StatisticsEvent with _$StatisticsEvent {
  const StatisticsEvent._();

  const factory StatisticsEvent.fetchStatistics() = _FetchStatisticsEvent;
}
