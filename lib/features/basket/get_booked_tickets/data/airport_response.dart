import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport_response.g.dart';

@JsonSerializable()
class AirportResponse {
  final String name;
  final String location;

  const AirportResponse({
    required this.name,
    required this.location,
  });

  factory AirportResponse.fromJson(Map<String, dynamic> json) =>
      _$AirportResponseFromJson(json);
}
