part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const EditProfileEvent._();

  const factory EditProfileEvent.updateProfileInfo({
    required String passengerId,
    required String firstName,
    required String lastName,
    required String dtBirth,
    required String email,
    required String passportDetails,
}) = _UpdateProfileInfoEvent;
}
