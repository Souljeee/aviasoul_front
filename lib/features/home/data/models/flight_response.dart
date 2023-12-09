import 'package:aviasoul_front/features/home/data/models/airport_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_response.g.dart';

@JsonSerializable()
class FlightResponse {
  final String id;
  final AirportResponse departureAirport;
  final AirportResponse arrivalAirport;
  final String departureDate;
  final String arrivalDate;
  final String departureTime;
  final String arrivalTime;
  final int allTicketsCount;
  final int defaultTicketsCount;
  final int businessTicketsCount;
  final int businessPrice;
  final int defaultPrice;

  const FlightResponse({
    required this.id,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureDate,
    required this.arrivalDate,
    required this.departureTime,
    required this.arrivalTime,
    required this.allTicketsCount,
    required this.defaultTicketsCount,
    required this.businessTicketsCount,
    required this.businessPrice,
    required this.defaultPrice,
  });

  factory FlightResponse.fromJson(Map<String, dynamic> json) =>
      _$FlightResponseFromJson(json);
}
