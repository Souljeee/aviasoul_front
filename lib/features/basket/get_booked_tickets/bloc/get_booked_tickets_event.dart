part of 'get_booked_tickets_bloc.dart';

@freezed
class GetBookedTicketsEvent with _$GetBookedTicketsEvent {
  const GetBookedTicketsEvent._();

  const factory GetBookedTicketsEvent.getBookedTickets() =
      _GetBookedTicketsEventEvent;

  const factory GetBookedTicketsEvent.getPayedTickets() =
      _GetPayedTicketsEventEvent;
}
