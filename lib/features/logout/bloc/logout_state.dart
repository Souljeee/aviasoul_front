part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState{
  const LogoutState._();

  const factory LogoutState.loading() = _LoadingState;

  const factory LogoutState.success() = _SuccessState;

  const factory LogoutState.error() = _ErrorState;

  const factory LogoutState.idle() = _IdleState;
}