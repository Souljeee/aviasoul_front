part of 'pay_for_ticket_bloc.dart';

@freezed
class PayForTicketState with _$PayForTicketState {
  const PayForTicketState._();

  const factory PayForTicketState.idle() = _IdleState;

  const factory PayForTicketState.loading() = _LoadingState;

  const factory PayForTicketState.success() = _SuccessState;

  const factory PayForTicketState.error() = _ErrorState;
}
