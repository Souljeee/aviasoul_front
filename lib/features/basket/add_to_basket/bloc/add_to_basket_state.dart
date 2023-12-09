part of 'add_to_basket_bloc.dart';

@freezed
class AddToBasketState with _$AddToBasketState{
  const AddToBasketState._();

  const factory AddToBasketState.idle() = _IdleState;

  const factory AddToBasketState.loading() = _LoadingState;

  const factory AddToBasketState.success() = _SuccessState;

  const factory AddToBasketState.error() = _ErrorState;
}
