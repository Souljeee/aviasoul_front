part of 'get_booked_tickets_bloc.dart';

@freezed
class GetBookedTicketsState with _$GetBookedTicketsState {
  const GetBookedTicketsState._();

  const factory GetBookedTicketsState.idle() = _IdleState;

  const factory GetBookedTicketsState.loading() = _LoadingState;

  const factory GetBookedTicketsState.success({
    required List<BookedTicketsResponse> bookedTickets,
  }) = _SuccessState;

  const factory GetBookedTicketsState.error() = _ErrorState;

  int? get basketTicketsCount => map(
        idle: (_) => null,
        loading: (_) => null,
        success: (state) => state.bookedTickets.length,
        error: (_) => null,
      );
}
