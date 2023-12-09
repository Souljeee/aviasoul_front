import 'dart:async';

import 'package:aviasoul_front/features/auth/data/auth_repository.dart';
import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';

part 'logout_state.dart';

part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepository _authRepository;

  LogoutBloc({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
        super(const LogoutState.idle()) {
    on<LogoutEvent>(
      (event, emit) => event.map(
        logout: (event) => _onLogoutUser(event, emit),
      ),
    );
  }

  Future<void> _onLogoutUser(
    _LogoutEvent event,
    Emitter<LogoutState> emit,
  ) async {
    try {
      emit(const LogoutState.loading());

      final token = SharedPreferencesManager.getAuthToken();

      _authRepository.logout(token: token);

      SharedPreferencesManager.clearAuthToken();

      emit(const LogoutState.success());
    } catch (e, s) {
      addError(e, s);

      emit(const LogoutState.error());
    }
  }
}
