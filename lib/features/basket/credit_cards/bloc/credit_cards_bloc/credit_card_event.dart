part of 'credit_card_bloc.dart';

@freezed
class CreditCardEvent with _$CreditCardEvent {
  const CreditCardEvent._();

  const factory CreditCardEvent.getCreditCardList() = _GetCreditCardListEvent;

  const factory CreditCardEvent.deleteCard({required String cardId}) = _DeleteCardEvent;
}
