part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.authUser({
    required String email,
    required String password,
  }) = _AuthUserEvent;
}
