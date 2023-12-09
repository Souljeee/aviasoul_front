import 'dart:async';

import 'package:aviasoul_front/features/basket/common/data/basket_repository.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/data/booked_tickets_response.dart';
import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_booked_tickets_event.dart';

part 'get_booked_tickets_state.dart';

part 'get_booked_tickets_bloc.freezed.dart';

class GetBookedTicketsBloc
    extends Bloc<GetBookedTicketsEvent, GetBookedTicketsState> {
  final BasketRepository _basketRepository;
  final ProfileRepository _profileRepository;

  GetBookedTicketsBloc({
    required BasketRepository basketRepository,
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository,
        _basketRepository = basketRepository,
        super(const GetBookedTicketsState.idle()) {
    on<GetBookedTicketsEvent>(
      (event, emit) => event.map(
        getBookedTickets: (event) => onGetBookedTcikets(event, emit),
        getPayedTickets: (event) => onGetPayedTickets(event, emit),
      ),
    );
  }

  Future<void> onGetBookedTcikets(
    _GetBookedTicketsEventEvent event,
    Emitter<GetBookedTicketsState> emit,
  ) async {
    try {
      emit(const GetBookedTicketsState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      final profile = await _profileRepository.getProfileByToken(token: token);

      final response = await _basketRepository.getBookedTickets(passengerId: profile.id);

      emit(GetBookedTicketsState.success(bookedTickets: response));
    } catch (e, s) {
      addError(e, s);

      emit(const GetBookedTicketsState.error());
    }
  }

  Future<void> onGetPayedTickets(
      _GetPayedTicketsEventEvent event,
      Emitter<GetBookedTicketsState> emit,
      ) async {
    try {
      emit(const GetBookedTicketsState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      final profile = await _profileRepository.getProfileByToken(token: token);

      final response = await _basketRepository.getPayedTickets(passengerId: profile.id);

      emit(GetBookedTicketsState.success(bookedTickets: response));
    } catch (e, s) {
      addError(e, s);

      emit(const GetBookedTicketsState.error());
    }
  }
}
