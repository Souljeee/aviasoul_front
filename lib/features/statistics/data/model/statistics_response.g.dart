// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsResponse _$StatisticsResponseFromJson(Map<String, dynamic> json) =>
    StatisticsResponse(
      averageAge: json['averageAge'] as int,
      mostAirportsLocation: json['mostAirportsLocation'] as String,
      cardsCount: json['cardsCount'] as int,
      mostArrivedCity: json['mostArrivedCity'] as String,
      maxPrice: json['maxPrice'] as int,
      minPrice: json['minPrice'] as int,
      businessCount: json['businessCount'] as int,
      defaultCount: json['defaultCount'] as int,
      paymentsCount: json['paymentsCount'] as int,
      flightsPerMonth: Map<String, int>.from(json['flightsPerMonth'] as Map),
    );

Map<String, dynamic> _$StatisticsResponseToJson(StatisticsResponse instance) =>
    <String, dynamic>{
      'averageAge': instance.averageAge,
      'mostAirportsLocation': instance.mostAirportsLocation,
      'cardsCount': instance.cardsCount,
      'mostArrivedCity': instance.mostArrivedCity,
      'maxPrice': instance.maxPrice,
      'minPrice': instance.minPrice,
      'businessCount': instance.businessCount,
      'defaultCount': instance.defaultCount,
      'paymentsCount': instance.paymentsCount,
      'flightsPerMonth': instance.flightsPerMonth,
    };
