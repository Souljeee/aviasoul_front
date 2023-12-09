part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const RegistrationEvent._();

  const factory RegistrationEvent.createUser({
    required String firstName,
    required String lastName,
    required String dtBirth,
    required String passportDetails,
    required String email,
    required String password,
  }) = _CreateUserEvent;
}
