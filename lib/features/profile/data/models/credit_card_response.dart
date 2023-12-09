import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_response.g.dart';

@JsonSerializable()
class CreditCardResponse {
  final String id;
  final String number;
  final String date;
  final String cvv;

  CreditCardResponse({
    required this.id,
    required this.number,
    required this.date,
    required this.cvv,
  });

  factory CreditCardResponse.fromJson(Map<String, dynamic> json) => _$CreditCardResponseFromJson(json);
}
