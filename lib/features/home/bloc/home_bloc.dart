import 'dart:async';

import 'package:aviasoul_front/features/home/data/flights_repository.dart';
import 'package:aviasoul_front/features/home/data/models/flight_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FlightsRepository _flightsRepository;

  HomeBloc({
    required FlightsRepository flightsRepository,
  })  : _flightsRepository = flightsRepository,
        super(const HomeState.idle()) {
    on<HomeEvent>(
      (event, emit) => event.map(
        fetchFlights: (event) => _onFetchFlights(event, emit),
      ),
    );
  }

  Future<void> _onFetchFlights(
    _FetchFlightsEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(const HomeState.loading());

      final List<FlightResponse> response = await _flightsRepository.getFlights(
        departureCity: event.departureCity,
        arrivedCity: event.arrivedCity,
        departureDt: event.departureDt,
        arrivedDt: event.arrivedDt,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      );

      emit(HomeState.success(flights: response));
    } catch (e, s) {
      addError(e, s);

      emit(const HomeState.error());
    }
  }
}
