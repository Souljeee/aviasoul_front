import 'package:aviasoul_front/features/basket/get_booked_tickets/data/airport_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_response.g.dart';

@JsonSerializable()
class FlightResponse {
  final AirportResponse departureAirport;
  final AirportResponse arrivalAirport;
  final String departureDate;
  final String arrivalDate;
  final String departureTime;
  final String arrivalTime;

  const FlightResponse({
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureDate,
    required this.arrivalDate,
    required this.departureTime,
    required this.arrivalTime,
  });

  factory FlightResponse.fromJson(Map<String, dynamic> json) =>
      _$FlightResponseFromJson(json);
}
