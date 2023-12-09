part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState{
  const ProfileState._();

  const factory ProfileState.idle() = _IdleState;

  const factory ProfileState.loading() = _LoadingState;

  const factory ProfileState.success({
    required ProfileResponse profile,
}) = _SuccessState;

  const factory ProfileState.error() = _ErrorState;
}
