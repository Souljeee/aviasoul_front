import 'dart:async';

import 'package:aviasoul_front/features/basket/common/data/basket_repository.dart';
import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_basket_event.dart';

part 'add_to_basket_state.dart';

part 'add_to_basket_bloc.freezed.dart';

class AddToBasketBloc extends Bloc<AddToBasketEvent, AddToBasketState> {
  final BasketRepository _basketRepository;
  final ProfileRepository _profileRepository;

  AddToBasketBloc({
    required BasketRepository basketRepository,
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        _basketRepository = basketRepository,
        super(const AddToBasketState.idle()) {
    on<AddToBasketEvent>(
      (event, emit) => event.map(
        addToBasket: (event) => _onAddToBasket(event, emit),
      ),
    );
  }

  Future<void> _onAddToBasket(
    _AddToBasketEvent event,
    Emitter<AddToBasketState> emit,
  ) async {
    try {
      emit(const AddToBasketState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      final profile = await _profileRepository.getProfileByToken(token: token);

      await _basketRepository.addToBasket(
        flightId: event.flightId,
        passengerId: profile.id,
        count: event.count,
        type: event.type,
      );

      emit(const AddToBasketState.success());

      emit(const AddToBasketState.idle());
    } catch (e, s) {
      addError(e, s);

      emit(const AddToBasketState.error());

      emit(const AddToBasketState.idle());
    }
  }
}
