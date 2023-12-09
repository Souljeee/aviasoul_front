// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_guard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthGuardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStateEvent value) checkAuthState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStateEvent value)? checkAuthState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStateEvent value)? checkAuthState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGuardEventCopyWith<$Res> {
  factory $AuthGuardEventCopyWith(
          AuthGuardEvent value, $Res Function(AuthGuardEvent) then) =
      _$AuthGuardEventCopyWithImpl<$Res, AuthGuardEvent>;
}

/// @nodoc
class _$AuthGuardEventCopyWithImpl<$Res, $Val extends AuthGuardEvent>
    implements $AuthGuardEventCopyWith<$Res> {
  _$AuthGuardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthStateEventImplCopyWith<$Res> {
  factory _$$CheckAuthStateEventImplCopyWith(_$CheckAuthStateEventImpl value,
          $Res Function(_$CheckAuthStateEventImpl) then) =
      __$$CheckAuthStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStateEventImplCopyWithImpl<$Res>
    extends _$AuthGuardEventCopyWithImpl<$Res, _$CheckAuthStateEventImpl>
    implements _$$CheckAuthStateEventImplCopyWith<$Res> {
  __$$CheckAuthStateEventImplCopyWithImpl(_$CheckAuthStateEventImpl _value,
      $Res Function(_$CheckAuthStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthStateEventImpl extends _CheckAuthStateEvent {
  const _$CheckAuthStateEventImpl() : super._();

  @override
  String toString() {
    return 'AuthGuardEvent.checkAuthState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAuthStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthState,
  }) {
    return checkAuthState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthState,
  }) {
    return checkAuthState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthState,
    required TResult orElse(),
  }) {
    if (checkAuthState != null) {
      return checkAuthState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStateEvent value) checkAuthState,
  }) {
    return checkAuthState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStateEvent value)? checkAuthState,
  }) {
    return checkAuthState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStateEvent value)? checkAuthState,
    required TResult orElse(),
  }) {
    if (checkAuthState != null) {
      return checkAuthState(this);
    }
    return orElse();
  }
}

abstract class _CheckAuthStateEvent extends AuthGuardEvent {
  const factory _CheckAuthStateEvent() = _$CheckAuthStateEventImpl;
  const _CheckAuthStateEvent._() : super._();
}

/// @nodoc
mixin _$AuthGuardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() auth,
    required TResult Function() notAuth,
    required TResult Function() checking,
    required TResult Function() checkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? auth,
    TResult? Function()? notAuth,
    TResult? Function()? checking,
    TResult? Function()? checkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? auth,
    TResult Function()? notAuth,
    TResult Function()? checking,
    TResult Function()? checkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthState value) auth,
    required TResult Function(_NotAuthState value) notAuth,
    required TResult Function(_CheckingState value) checking,
    required TResult Function(_CheckErrorState value) checkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthState value)? auth,
    TResult? Function(_NotAuthState value)? notAuth,
    TResult? Function(_CheckingState value)? checking,
    TResult? Function(_CheckErrorState value)? checkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthState value)? auth,
    TResult Function(_NotAuthState value)? notAuth,
    TResult Function(_CheckingState value)? checking,
    TResult Function(_CheckErrorState value)? checkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGuardStateCopyWith<$Res> {
  factory $AuthGuardStateCopyWith(
          AuthGuardState value, $Res Function(AuthGuardState) then) =
      _$AuthGuardStateCopyWithImpl<$Res, AuthGuardState>;
}

/// @nodoc
class _$AuthGuardStateCopyWithImpl<$Res, $Val extends AuthGuardState>
    implements $AuthGuardStateCopyWith<$Res> {
  _$AuthGuardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthGuardStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl() : super._();

  @override
  String toString() {
    return 'AuthGuardState.auth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() auth,
    required TResult Function() notAuth,
    required TResult Function() checking,
    required TResult Function() checkError,
  }) {
    return auth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? auth,
    TResult? Function()? notAuth,
    TResult? Function()? checking,
    TResult? Function()? checkError,
  }) {
    return auth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? auth,
    TResult Function()? notAuth,
    TResult Function()? checking,
    TResult Function()? checkError,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthState value) auth,
    required TResult Function(_NotAuthState value) notAuth,
    required TResult Function(_CheckingState value) checking,
    required TResult Function(_CheckErrorState value) checkError,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthState value)? auth,
    TResult? Function(_NotAuthState value)? notAuth,
    TResult? Function(_CheckingState value)? checking,
    TResult? Function(_CheckErrorState value)? checkError,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthState value)? auth,
    TResult Function(_NotAuthState value)? notAuth,
    TResult Function(_CheckingState value)? checking,
    TResult Function(_CheckErrorState value)? checkError,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _AuthState extends AuthGuardState {
  const factory _AuthState() = _$AuthStateImpl;
  const _AuthState._() : super._();
}

/// @nodoc
abstract class _$$NotAuthStateImplCopyWith<$Res> {
  factory _$$NotAuthStateImplCopyWith(
          _$NotAuthStateImpl value, $Res Function(_$NotAuthStateImpl) then) =
      __$$NotAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotAuthStateImplCopyWithImpl<$Res>
    extends _$AuthGuardStateCopyWithImpl<$Res, _$NotAuthStateImpl>
    implements _$$NotAuthStateImplCopyWith<$Res> {
  __$$NotAuthStateImplCopyWithImpl(
      _$NotAuthStateImpl _value, $Res Function(_$NotAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotAuthStateImpl extends _NotAuthState {
  const _$NotAuthStateImpl() : super._();

  @override
  String toString() {
    return 'AuthGuardState.notAuth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() auth,
    required TResult Function() notAuth,
    required TResult Function() checking,
    required TResult Function() checkError,
  }) {
    return notAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? auth,
    TResult? Function()? notAuth,
    TResult? Function()? checking,
    TResult? Function()? checkError,
  }) {
    return notAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? auth,
    TResult Function()? notAuth,
    TResult Function()? checking,
    TResult Function()? checkError,
    required TResult orElse(),
  }) {
    if (notAuth != null) {
      return notAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthState value) auth,
    required TResult Function(_NotAuthState value) notAuth,
    required TResult Function(_CheckingState value) checking,
    required TResult Function(_CheckErrorState value) checkError,
  }) {
    return notAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthState value)? auth,
    TResult? Function(_NotAuthState value)? notAuth,
    TResult? Function(_CheckingState value)? checking,
    TResult? Function(_CheckErrorState value)? checkError,
  }) {
    return notAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthState value)? auth,
    TResult Function(_NotAuthState value)? notAuth,
    TResult Function(_CheckingState value)? checking,
    TResult Function(_CheckErrorState value)? checkError,
    required TResult orElse(),
  }) {
    if (notAuth != null) {
      return notAuth(this);
    }
    return orElse();
  }
}

abstract class _NotAuthState extends AuthGuardState {
  const factory _NotAuthState() = _$NotAuthStateImpl;
  const _NotAuthState._() : super._();
}

/// @nodoc
abstract class _$$CheckingStateImplCopyWith<$Res> {
  factory _$$CheckingStateImplCopyWith(
          _$CheckingStateImpl value, $Res Function(_$CheckingStateImpl) then) =
      __$$CheckingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingStateImplCopyWithImpl<$Res>
    extends _$AuthGuardStateCopyWithImpl<$Res, _$CheckingStateImpl>
    implements _$$CheckingStateImplCopyWith<$Res> {
  __$$CheckingStateImplCopyWithImpl(
      _$CheckingStateImpl _value, $Res Function(_$CheckingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckingStateImpl extends _CheckingState {
  const _$CheckingStateImpl() : super._();

  @override
  String toString() {
    return 'AuthGuardState.checking()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() auth,
    required TResult Function() notAuth,
    required TResult Function() checking,
    required TResult Function() checkError,
  }) {
    return checking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? auth,
    TResult? Function()? notAuth,
    TResult? Function()? checking,
    TResult? Function()? checkError,
  }) {
    return checking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? auth,
    TResult Function()? notAuth,
    TResult Function()? checking,
    TResult Function()? checkError,
    required TResult orElse(),
  }) {
    if (checking != null) {
      return checking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthState value) auth,
    required TResult Function(_NotAuthState value) notAuth,
    required TResult Function(_CheckingState value) checking,
    required TResult Function(_CheckErrorState value) checkError,
  }) {
    return checking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthState value)? auth,
    TResult? Function(_NotAuthState value)? notAuth,
    TResult? Function(_CheckingState value)? checking,
    TResult? Function(_CheckErrorState value)? checkError,
  }) {
    return checking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthState value)? auth,
    TResult Function(_NotAuthState value)? notAuth,
    TResult Function(_CheckingState value)? checking,
    TResult Function(_CheckErrorState value)? checkError,
    required TResult orElse(),
  }) {
    if (checking != null) {
      return checking(this);
    }
    return orElse();
  }
}

abstract class _CheckingState extends AuthGuardState {
  const factory _CheckingState() = _$CheckingStateImpl;
  const _CheckingState._() : super._();
}

/// @nodoc
abstract class _$$CheckErrorStateImplCopyWith<$Res> {
  factory _$$CheckErrorStateImplCopyWith(_$CheckErrorStateImpl value,
          $Res Function(_$CheckErrorStateImpl) then) =
      __$$CheckErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckErrorStateImplCopyWithImpl<$Res>
    extends _$AuthGuardStateCopyWithImpl<$Res, _$CheckErrorStateImpl>
    implements _$$CheckErrorStateImplCopyWith<$Res> {
  __$$CheckErrorStateImplCopyWithImpl(
      _$CheckErrorStateImpl _value, $Res Function(_$CheckErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckErrorStateImpl extends _CheckErrorState {
  const _$CheckErrorStateImpl() : super._();

  @override
  String toString() {
    return 'AuthGuardState.checkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() auth,
    required TResult Function() notAuth,
    required TResult Function() checking,
    required TResult Function() checkError,
  }) {
    return checkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? auth,
    TResult? Function()? notAuth,
    TResult? Function()? checking,
    TResult? Function()? checkError,
  }) {
    return checkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? auth,
    TResult Function()? notAuth,
    TResult Function()? checking,
    TResult Function()? checkError,
    required TResult orElse(),
  }) {
    if (checkError != null) {
      return checkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthState value) auth,
    required TResult Function(_NotAuthState value) notAuth,
    required TResult Function(_CheckingState value) checking,
    required TResult Function(_CheckErrorState value) checkError,
  }) {
    return checkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthState value)? auth,
    TResult? Function(_NotAuthState value)? notAuth,
    TResult? Function(_CheckingState value)? checking,
    TResult? Function(_CheckErrorState value)? checkError,
  }) {
    return checkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthState value)? auth,
    TResult Function(_NotAuthState value)? notAuth,
    TResult Function(_CheckingState value)? checking,
    TResult Function(_CheckErrorState value)? checkError,
    required TResult orElse(),
  }) {
    if (checkError != null) {
      return checkError(this);
    }
    return orElse();
  }
}

abstract class _CheckErrorState extends AuthGuardState {
  const factory _CheckErrorState() = _$CheckErrorStateImpl;
  const _CheckErrorState._() : super._();
}
