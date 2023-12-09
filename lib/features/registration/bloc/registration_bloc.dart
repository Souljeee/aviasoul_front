import 'dart:async';

import 'package:aviasoul_front/features/registration/data/registration_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_event.dart';

part 'registration_state.dart';

part 'registration_bloc.freezed.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository _registrationRepository;

  RegistrationBloc({
    required RegistrationRepository registrationRepository,
  })  : _registrationRepository = registrationRepository,
        super(const RegistrationState.idle()) {
    on<RegistrationEvent>(
      (event, emit) => event.map(
        createUser: (event) => _onCreateUser(event, emit),
      ),
    );
  }

  Future<void> _onCreateUser(
      _CreateUserEvent event, Emitter<RegistrationState> emit) async {
    try {
      emit(const RegistrationState.loading());

      final response = await _registrationRepository.createUser(
        firstName: event.firstName,
        lastName: event.lastName,
        dtBirth: event.dtBirth,
        passportDetails: event.passportDetails,
        email: event.email,
        password: event.password,
      );

      emit(RegistrationState.success(
        allowAccess: response.accessAllowed,
      ));
    } catch (e, s) {
      addError(e, s);

      emit(const RegistrationState.error());
    }
  }
}
