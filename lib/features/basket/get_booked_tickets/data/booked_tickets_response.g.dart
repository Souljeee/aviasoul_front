// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_tickets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedTicketsResponse _$BookedTicketsResponseFromJson(
        Map<String, dynamic> json) =>
    BookedTicketsResponse(
      flightInfo:
          FlightResponse.fromJson(json['flightInfo'] as Map<String, dynamic>),
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookedTicketsResponseToJson(
        BookedTicketsResponse instance) =>
    <String, dynamic>{
      'flightInfo': instance.flightInfo,
      'tickets': instance.tickets,
    };
