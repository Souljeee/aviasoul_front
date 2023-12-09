// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightResponse _$FlightResponseFromJson(Map<String, dynamic> json) =>
    FlightResponse(
      id: json['id'] as String,
      departureAirport: AirportResponse.fromJson(
          json['departureAirport'] as Map<String, dynamic>),
      arrivalAirport: AirportResponse.fromJson(
          json['arrivalAirport'] as Map<String, dynamic>),
      departureDate: json['departureDate'] as String,
      arrivalDate: json['arrivalDate'] as String,
      departureTime: json['departureTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
      allTicketsCount: json['allTicketsCount'] as int,
      defaultTicketsCount: json['defaultTicketsCount'] as int,
      businessTicketsCount: json['businessTicketsCount'] as int,
      businessPrice: json['businessPrice'] as int,
      defaultPrice: json['defaultPrice'] as int,
    );

Map<String, dynamic> _$FlightResponseToJson(FlightResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departureAirport': instance.departureAirport,
      'arrivalAirport': instance.arrivalAirport,
      'departureDate': instance.departureDate,
      'arrivalDate': instance.arrivalDate,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'allTicketsCount': instance.allTicketsCount,
      'defaultTicketsCount': instance.defaultTicketsCount,
      'businessTicketsCount': instance.businessTicketsCount,
      'businessPrice': instance.businessPrice,
      'defaultPrice': instance.defaultPrice,
    };
