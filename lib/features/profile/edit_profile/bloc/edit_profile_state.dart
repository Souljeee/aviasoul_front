part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState{
  const EditProfileState._();

  const factory EditProfileState.idle() = _IdleState;

  const factory EditProfileState.loading() = _LoadingState;

  const factory EditProfileState.success() = _SuccessState;

  const factory EditProfileState.error() = _ErrorState;
}
