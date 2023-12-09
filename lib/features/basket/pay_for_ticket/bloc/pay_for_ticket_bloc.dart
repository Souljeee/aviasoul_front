import 'dart:async';

import 'package:aviasoul_front/features/basket/common/data/basket_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_for_ticket_event.dart';

part 'pay_for_ticket_state.dart';

part 'pay_for_ticket_bloc.freezed.dart';

class PayForTicketBloc extends Bloc<PayForTicketEvent, PayForTicketState> {
  final BasketRepository _basketRepository;

  PayForTicketBloc({
    required BasketRepository basketRepository,
  })  : _basketRepository = basketRepository,
        super(const PayForTicketState.idle()) {
    on<PayForTicketEvent>(
      (event, emit) => event.map(
        pay: (event) => _onPay(event, emit),
      ),
    );
  }

  Future<void> _onPay(
    _PayEvent event,
    Emitter<PayForTicketState> emit,
  ) async {
    try {
      emit(const PayForTicketState.loading());

      await _basketRepository.payForTicket(
        ticketsId: event.ticketsId,
        amount: event.amount,
        transactionTime: event.transactionTime,
      );

      emit(const PayForTicketState.success());
    } catch (e, s) {
      addError(e, s);

      emit(const PayForTicketState.error());
    }
  }
}
