part of 'auth_guard_bloc.dart';

@freezed
class AuthGuardState with _$AuthGuardState{
  const AuthGuardState._();

  const factory AuthGuardState.auth() = _AuthState;

  const factory AuthGuardState.notAuth() = _NotAuthState;

  const factory AuthGuardState.checking() = _CheckingState;

  const factory AuthGuardState.checkError() = _CheckErrorState;
}
