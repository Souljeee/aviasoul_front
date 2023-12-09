import 'package:aviasoul_front/features/basket/get_booked_tickets/data/flight_response.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/data/ticket_respones.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booked_tickets_response.g.dart';

@JsonSerializable()
class BookedTicketsResponse {
  final FlightResponse flightInfo;
  final List<TicketResponse> tickets;

  const BookedTicketsResponse({
    required this.flightInfo,
    required this.tickets,
  });

  factory BookedTicketsResponse.fromJson(Map<String, dynamic> json) =>
      _$BookedTicketsResponseFromJson(json);
}
