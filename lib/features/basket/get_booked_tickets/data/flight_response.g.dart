// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightResponse _$FlightResponseFromJson(Map<String, dynamic> json) =>
    FlightResponse(
      departureAirport: AirportResponse.fromJson(
          json['departureAirport'] as Map<String, dynamic>),
      arrivalAirport: AirportResponse.fromJson(
          json['arrivalAirport'] as Map<String, dynamic>),
      departureDate: json['departureDate'] as String,
      arrivalDate: json['arrivalDate'] as String,
      departureTime: json['departureTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
    );

Map<String, dynamic> _$FlightResponseToJson(FlightResponse instance) =>
    <String, dynamic>{
      'departureAirport': instance.departureAirport,
      'arrivalAirport': instance.arrivalAirport,
      'departureDate': instance.departureDate,
      'arrivalDate': instance.arrivalDate,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
    };
