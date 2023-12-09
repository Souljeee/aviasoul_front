// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardResponse _$CreditCardResponseFromJson(Map<String, dynamic> json) =>
    CreditCardResponse(
      id: json['id'] as String,
      number: json['number'] as String,
      date: json['date'] as String,
      cvv: json['cvv'] as String,
    );

Map<String, dynamic> _$CreditCardResponseToJson(CreditCardResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'date': instance.date,
      'cvv': instance.cvv,
    };
