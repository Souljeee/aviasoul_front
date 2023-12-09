import 'dart:async';

import 'package:aviasoul_front/features/auth/data/auth_repository.dart';
import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.idle()) {
    on<AuthEvent>(
      (event, emit) => event.map(
        authUser: (event) => _onAuthUser(event, emit),
      ),
    );
  }

  Future<void> _onAuthUser(
    _AuthUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final response = await _authRepository.authUser(
        email: event.email,
        password: event.password,
      );

      SharedPreferencesManager.setToken(token: response.token);

      emit(const AuthState.success());
    } catch (e, s) {
      addError(e, s);
    }
  }
}
