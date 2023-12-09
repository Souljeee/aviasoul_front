import 'dart:async';

import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:aviasoul_front/features/profile/data/models/credit_card_response.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_event.dart';

part 'credit_card_state.dart';

part 'credit_card_bloc.freezed.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  final ProfileRepository _profileRepository;

  CreditCardBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const CreditCardState.idle()) {
    on<CreditCardEvent>(
      (event, emit) => event.map(
        getCreditCardList: (_) => _onGetCreditCardList(emit),
        deleteCard: (event) => _onDeleteCard(event, emit),
      ),
    );
  }

  Future<void> _onGetCreditCardList(Emitter<CreditCardState> emit) async {
    try {
      emit(const CreditCardState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      final profile = await _profileRepository.getProfileByToken(token: token);

      final creditCards = await _profileRepository.getCreditCardsByPassengerId(
        passengerId: profile.id,
      );

      emit(CreditCardState.success(creditCards: creditCards));
    } catch (e, s) {
      addError(e, s);

      emit(const CreditCardState.error());
    }
  }

  Future<void> _onDeleteCard(
    _DeleteCardEvent event,
    Emitter<CreditCardState> emit,
  ) async {
    state.mapOrNull(
      success: (state) {
        try {
          _profileRepository.deleteCard(cardId: event.cardId);

          emit(
            CreditCardState.success(
              creditCards: state.creditCards
                  .where((element) => element.id != event.cardId)
                  .toList(),
            ),
          );
        } catch (e, s) {
          addError(e, s);
        }
      },
    );
  }
}
