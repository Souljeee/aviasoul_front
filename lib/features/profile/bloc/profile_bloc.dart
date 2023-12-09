import 'dart:async';

import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:aviasoul_front/features/profile/data/models/profile_response.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository,
        super(const ProfileState.idle()) {
    on<ProfileEvent>(
      (event, emit) => event.map(
        fetchProfileInfo: (_) => _onFetchProfileInfo(emit),
      ),
    );
  }

  Future<void> _onFetchProfileInfo(Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      final profile = await _profileRepository.getProfileByToken(token: token);

      emit(ProfileState.success(profile: profile));
    } catch (e, s) {
      addError(e, s);

      emit(const ProfileState.error());
    }
  }
}
