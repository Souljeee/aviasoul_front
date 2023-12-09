part of 'add_new_credit_card_bloc.dart';

@freezed
class AddNewCreditCardState with _$AddNewCreditCardState {
  const AddNewCreditCardState._();

  const factory AddNewCreditCardState.idle() = _IdleState;

  const factory AddNewCreditCardState.loading() = _LoadingState;

  const factory AddNewCreditCardState.success() = _SuccessState;

  const factory AddNewCreditCardState.error() = _ErrorState;
}
