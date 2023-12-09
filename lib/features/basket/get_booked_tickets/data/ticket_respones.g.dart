// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_respones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) =>
    TicketResponse(
      id: json['id'] as String,
      seatNumber: json['seatNumber'] as String,
      price: json['price'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TicketResponseToJson(TicketResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seatNumber': instance.seatNumber,
      'price': instance.price,
      'type': instance.type,
    };
