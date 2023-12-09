import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_response.g.dart';

@JsonSerializable()
class StatisticsResponse {
  final int averageAge;
  final String mostAirportsLocation;
  final int cardsCount;
  final String mostArrivedCity;
  final int maxPrice;
  final int minPrice;
  final int businessCount;
  final int defaultCount;
  final int paymentsCount;
  final Map<String, int> flightsPerMonth;

  StatisticsResponse({
    required this.averageAge,
    required this.mostAirportsLocation,
    required this.cardsCount,
    required this.mostArrivedCity,
    required this.maxPrice,
    required this.minPrice,
    required this.businessCount,
    required this.defaultCount,
    required this.paymentsCount,
    required this.flightsPerMonth,
  });

  factory StatisticsResponse.fromJson(Map<String, dynamic> json) => _$StatisticsResponseFromJson(json);
}
