import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_respones.g.dart';

@JsonSerializable()
class TicketResponse {
  final String id;
  final String seatNumber;
  final int price;
  final String type;

  const TicketResponse({
    required this.id,
    required this.seatNumber,
    required this.price,
    required this.type,
  });

  factory TicketResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseFromJson(json);
}
