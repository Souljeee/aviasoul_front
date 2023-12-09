import 'dart:async';

import 'package:aviasoul_front/features/profile/bloc/profile_bloc.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final ProfileRepository _profileRepository;

  EditProfileBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const EditProfileState.idle()) {
    on<EditProfileEvent>(
      (event, emit) => event.map(
        updateProfileInfo: (event) => _onUpdateProfileInfo(event, emit),
      ),
    );
  }

  Future<void> _onUpdateProfileInfo(
    _UpdateProfileInfoEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    try {
      emit(const EditProfileState.loading());

      await _profileRepository.updateProfileInfo(
        passengerId: event.passengerId,
        firstName: event.firstName,
        lastName: event.lastName,
        dtBirth: event.dtBirth,
        email: event.email,
        passportDetails: event.passportDetails,
      );

      emit(const EditProfileState.success());
    } catch (e, s) {
      addError(e, s);
      emit(const EditProfileState.error());
    }
  }
}
