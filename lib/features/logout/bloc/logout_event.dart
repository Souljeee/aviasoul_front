part of 'logout_bloc.dart';

@freezed
class LogoutEvent with _$LogoutEvent {
  const LogoutEvent._();

  const factory LogoutEvent.logout() = _LogoutEvent;
}
