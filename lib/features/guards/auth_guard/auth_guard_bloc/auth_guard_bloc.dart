import 'dart:async';

import 'package:aviasoul_front/features/managers/shared_prefernces_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_guard_event.dart';

part 'auth_guard_state.dart';

part 'auth_guard_bloc.freezed.dart';

class AuthGuardBloc extends Bloc<AuthGuardEvent, AuthGuardState> {
  AuthGuardBloc() : super(const AuthGuardState.checking()) {
    on<AuthGuardEvent>(
      (event, emit) => event.map(
        checkAuthState: (_) => _onCheckAuthState(emit),
      ),
    );
  }

  Future<void> _onCheckAuthState(Emitter<AuthGuardState> emit) async {
    try{
      emit(const AuthGuardState.checking());

      final bool tokenExist = SharedPreferencesManager.checkIsTokenExist();

      if(tokenExist){
        emit(const AuthGuardState.auth());
      }else{
        emit(const AuthGuardState.notAuth());
      }
    }catch(e,s){
      addError(e,s);

      emit(const AuthGuardState.checkError());
    }
  }
}
