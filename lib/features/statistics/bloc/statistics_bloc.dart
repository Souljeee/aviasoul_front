import 'dart:async';

import 'package:aviasoul_front/features/statistics/data/model/statistics_response.dart';
import 'package:aviasoul_front/features/statistics/data/statistics_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_event.dart';

part 'statistics_state.dart';

part 'statistics_bloc.freezed.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticsRepository _statisticsRepository;

  StatisticsBloc({
    required StatisticsRepository statisticsRepository,
  }) : _statisticsRepository = statisticsRepository,
        super(const StatisticsState.idle()) {
    on<StatisticsEvent>(
      (event, emit) => event.map(
        fetchStatistics: (_) => _onFetchStatistics(emit),
      ),
    );
  }

  Future<void> _onFetchStatistics(Emitter<StatisticsState> emit) async {
    try {
      emit(const StatisticsState.loading());

      final response = await _statisticsRepository.getStatistics();

      emit(StatisticsState.success(statistics: response));
    } catch (e, s) {
      addError(e, s);

      emit(const StatisticsState.error());
    }
  }
}
