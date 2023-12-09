part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState{
  const HomeState._();

  const factory HomeState.idle() = _IdleState;

  const factory HomeState.loading() = _LoadingState;

  const factory HomeState.success({required List<FlightResponse> flights}) = _SuccessState;

  const factory HomeState.error() = _ErrorState;
}
