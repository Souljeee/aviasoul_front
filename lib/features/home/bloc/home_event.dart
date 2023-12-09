part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const HomeEvent._();

  const factory HomeEvent.fetchFlights({
    required String? departureCity,
    required String? arrivedCity,
    required String? departureDt,
    required String? arrivedDt,
    required int? minPrice,
    required int? maxPrice,
  }) = _FetchFlightsEvent;
}
