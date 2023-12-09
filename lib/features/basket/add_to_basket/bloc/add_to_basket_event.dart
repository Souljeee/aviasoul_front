part of 'add_to_basket_bloc.dart';

@freezed
class AddToBasketEvent with _$AddToBasketEvent {
  const AddToBasketEvent._();

  const factory AddToBasketEvent.addToBasket({
    required String flightId,
    required int count,
    required String type,
  }) = _AddToBasketEvent;
}
