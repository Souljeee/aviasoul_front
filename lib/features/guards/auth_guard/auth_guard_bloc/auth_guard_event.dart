part of 'auth_guard_bloc.dart';

@freezed
class AuthGuardEvent with _$AuthGuardEvent{
  const AuthGuardEvent._();

  const factory AuthGuardEvent.checkAuthState() = _CheckAuthStateEvent;
}
