part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState{
  const RegistrationState._();

  const factory RegistrationState.loading() = _LoadingState;

  const factory RegistrationState.success({required bool allowAccess}) = _SuccessState;

  const factory RegistrationState.error() = _ErrorState;

  const factory RegistrationState.idle() = _IdleState;
}
