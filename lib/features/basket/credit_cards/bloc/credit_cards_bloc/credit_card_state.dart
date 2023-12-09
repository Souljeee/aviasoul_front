part of 'credit_card_bloc.dart';

@freezed
class CreditCardState with _$CreditCardState {
  const CreditCardState._();

  const factory CreditCardState.idle() = _IdleState;

  const factory CreditCardState.loading() = _LoadingState;

  const factory CreditCardState.success({
    required List<CreditCardResponse> creditCards,
  }) = _SuccessState;

  const factory CreditCardState.error() = _ErrorState;
}
