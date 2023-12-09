part of 'add_new_credit_card_bloc.dart';

@freezed
class AddNewCreditCardEvent with _$AddNewCreditCardEvent {
  const AddNewCreditCardEvent._();

  const factory AddNewCreditCardEvent.addNewCreditCard({
    required String number,
    required String date,
    required String cvv,
  }) = _AddNewCreditCardEvent;
}
