import 'dart:async';

import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_new_credit_card_event.dart';

part 'add_new_credit_card_state.dart';

part 'add_new_credit_card_bloc.freezed.dart';

class AddNewCreditCardBloc
    extends Bloc<AddNewCreditCardEvent, AddNewCreditCardState> {
  final ProfileRepository _profileRepository;

  AddNewCreditCardBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const AddNewCreditCardState.idle()) {
    on<AddNewCreditCardEvent>(
      (event, emit) => event.map(
        addNewCreditCard: (event) => _onAddNewCreditCard(event, emit),
      ),
    );
  }

  Future<void> _onAddNewCreditCard(
    _AddNewCreditCardEvent event,
    Emitter<AddNewCreditCardState> emit,
  ) async {
    try {
      emit(const AddNewCreditCardState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      final profile = await _profileRepository.getProfileByToken(token: token);

      await _profileRepository.addNewCreditCard(
        number: event.number,
        date: event.date,
        cvv: event.cvv,
        passengerId: profile.id,
      );

      emit(const AddNewCreditCardState.success());
    } catch (e, s) {
      addError(e, s);

      emit(const AddNewCreditCardState.error());
    }
  }
}
