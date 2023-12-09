part of 'pay_for_ticket_bloc.dart';

@freezed
class PayForTicketEvent with _$PayForTicketEvent {
  const PayForTicketEvent._();

  const factory PayForTicketEvent.pay({
    required List<String> ticketsId,
    required int amount,
    required String transactionTime,
}) = _PayEvent;
}
