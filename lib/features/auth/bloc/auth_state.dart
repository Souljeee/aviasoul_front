part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState{
  const AuthState._();

  const factory AuthState.loading() = _LoadingState;

  const factory AuthState.success() = _SuccessState;

  const factory AuthState.error() = _ErrorState;

  const factory AuthState.idle() = _IdleState;
}
