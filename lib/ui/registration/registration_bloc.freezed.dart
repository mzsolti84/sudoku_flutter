// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String firstName,
            String lastName, int age)
        register,
    required TResult Function() registrationStared,
    required TResult Function(bool visibility) passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult? Function()? registrationStared,
    TResult? Function(bool visibility)? passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult Function()? registrationStared,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_RegistrationStared value) registrationStared,
    required TResult Function(_PasswordVisibility value) passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_RegistrationStared value)? registrationStared,
    TResult? Function(_PasswordVisibility value)? passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_RegistrationStared value)? registrationStared,
    TResult Function(_PasswordVisibility value)? passwordVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEventCopyWith(
          RegistrationEvent value, $Res Function(RegistrationEvent) then) =
      _$RegistrationEventCopyWithImpl<$Res, RegistrationEvent>;
}

/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res, $Val extends RegistrationEvent>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RegisterCopyWith<$Res> {
  factory _$$_RegisterCopyWith(
          _$_Register value, $Res Function(_$_Register) then) =
      __$$_RegisterCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email,
      String password,
      String firstName,
      String lastName,
      int age});
}

/// @nodoc
class __$$_RegisterCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$_Register>
    implements _$$_RegisterCopyWith<$Res> {
  __$$_RegisterCopyWithImpl(
      _$_Register _value, $Res Function(_$_Register) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
  }) {
    return _then(_$_Register(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Register implements _Register {
  const _$_Register(
      this.email, this.password, this.firstName, this.lastName, this.age);

  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int age;

  @override
  String toString() {
    return 'RegistrationEvent.register(email: $email, password: $password, firstName: $firstName, lastName: $lastName, age: $age)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Register &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      __$$_RegisterCopyWithImpl<_$_Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String firstName,
            String lastName, int age)
        register,
    required TResult Function() registrationStared,
    required TResult Function(bool visibility) passwordVisibility,
  }) {
    return register(email, password, firstName, lastName, age);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult? Function()? registrationStared,
    TResult? Function(bool visibility)? passwordVisibility,
  }) {
    return register?.call(email, password, firstName, lastName, age);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult Function()? registrationStared,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(email, password, firstName, lastName, age);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_RegistrationStared value) registrationStared,
    required TResult Function(_PasswordVisibility value) passwordVisibility,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_RegistrationStared value)? registrationStared,
    TResult? Function(_PasswordVisibility value)? passwordVisibility,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_RegistrationStared value)? registrationStared,
    TResult Function(_PasswordVisibility value)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements RegistrationEvent {
  const factory _Register(
      final String email,
      final String password,
      final String firstName,
      final String lastName,
      final int age) = _$_Register;

  String get email;
  String get password;
  String get firstName;
  String get lastName;
  int get age;
  @JsonKey(ignore: true)
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegistrationStaredCopyWith<$Res> {
  factory _$$_RegistrationStaredCopyWith(_$_RegistrationStared value,
          $Res Function(_$_RegistrationStared) then) =
      __$$_RegistrationStaredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegistrationStaredCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$_RegistrationStared>
    implements _$$_RegistrationStaredCopyWith<$Res> {
  __$$_RegistrationStaredCopyWithImpl(
      _$_RegistrationStared _value, $Res Function(_$_RegistrationStared) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RegistrationStared implements _RegistrationStared {
  const _$_RegistrationStared();

  @override
  String toString() {
    return 'RegistrationEvent.registrationStared()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RegistrationStared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String firstName,
            String lastName, int age)
        register,
    required TResult Function() registrationStared,
    required TResult Function(bool visibility) passwordVisibility,
  }) {
    return registrationStared();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult? Function()? registrationStared,
    TResult? Function(bool visibility)? passwordVisibility,
  }) {
    return registrationStared?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult Function()? registrationStared,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (registrationStared != null) {
      return registrationStared();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_RegistrationStared value) registrationStared,
    required TResult Function(_PasswordVisibility value) passwordVisibility,
  }) {
    return registrationStared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_RegistrationStared value)? registrationStared,
    TResult? Function(_PasswordVisibility value)? passwordVisibility,
  }) {
    return registrationStared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_RegistrationStared value)? registrationStared,
    TResult Function(_PasswordVisibility value)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (registrationStared != null) {
      return registrationStared(this);
    }
    return orElse();
  }
}

abstract class _RegistrationStared implements RegistrationEvent {
  const factory _RegistrationStared() = _$_RegistrationStared;
}

/// @nodoc
abstract class _$$_PasswordVisibilityCopyWith<$Res> {
  factory _$$_PasswordVisibilityCopyWith(_$_PasswordVisibility value,
          $Res Function(_$_PasswordVisibility) then) =
      __$$_PasswordVisibilityCopyWithImpl<$Res>;
  @useResult
  $Res call({bool visibility});
}

/// @nodoc
class __$$_PasswordVisibilityCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$_PasswordVisibility>
    implements _$$_PasswordVisibilityCopyWith<$Res> {
  __$$_PasswordVisibilityCopyWithImpl(
      _$_PasswordVisibility _value, $Res Function(_$_PasswordVisibility) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibility = null,
  }) {
    return _then(_$_PasswordVisibility(
      null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PasswordVisibility implements _PasswordVisibility {
  const _$_PasswordVisibility(this.visibility);

  @override
  final bool visibility;

  @override
  String toString() {
    return 'RegistrationEvent.passwordVisibility(visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordVisibility &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, visibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordVisibilityCopyWith<_$_PasswordVisibility> get copyWith =>
      __$$_PasswordVisibilityCopyWithImpl<_$_PasswordVisibility>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String firstName,
            String lastName, int age)
        register,
    required TResult Function() registrationStared,
    required TResult Function(bool visibility) passwordVisibility,
  }) {
    return passwordVisibility(visibility);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult? Function()? registrationStared,
    TResult? Function(bool visibility)? passwordVisibility,
  }) {
    return passwordVisibility?.call(visibility);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String firstName,
            String lastName, int age)?
        register,
    TResult Function()? registrationStared,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (passwordVisibility != null) {
      return passwordVisibility(visibility);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Register value) register,
    required TResult Function(_RegistrationStared value) registrationStared,
    required TResult Function(_PasswordVisibility value) passwordVisibility,
  }) {
    return passwordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Register value)? register,
    TResult? Function(_RegistrationStared value)? registrationStared,
    TResult? Function(_PasswordVisibility value)? passwordVisibility,
  }) {
    return passwordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Register value)? register,
    TResult Function(_RegistrationStared value)? registrationStared,
    TResult Function(_PasswordVisibility value)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (passwordVisibility != null) {
      return passwordVisibility(this);
    }
    return orElse();
  }
}

abstract class _PasswordVisibility implements RegistrationEvent {
  const factory _PasswordVisibility(final bool visibility) =
      _$_PasswordVisibility;

  bool get visibility;
  @JsonKey(ignore: true)
  _$$_PasswordVisibilityCopyWith<_$_PasswordVisibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object? error, bool successfullyFinished)
        finished,
    required TResult Function(bool visibility) passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object? error, bool successfullyFinished)? finished,
    TResult? Function(bool visibility)? passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object? error, bool successfullyFinished)? finished,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_PasswordVisibilityState value)
        passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_PasswordVisibilityState value)? passwordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_PasswordVisibilityState value)? passwordVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RegistrationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object? error, bool successfullyFinished)
        finished,
    required TResult Function(bool visibility) passwordVisibility,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object? error, bool successfullyFinished)? finished,
    TResult? Function(bool visibility)? passwordVisibility,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object? error, bool successfullyFinished)? finished,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_PasswordVisibilityState value)
        passwordVisibility,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_PasswordVisibilityState value)? passwordVisibility,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_PasswordVisibilityState value)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegistrationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_FinishedCopyWith<$Res> {
  factory _$$_FinishedCopyWith(
          _$_Finished value, $Res Function(_$_Finished) then) =
      __$$_FinishedCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error, bool successfullyFinished});
}

/// @nodoc
class __$$_FinishedCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_Finished>
    implements _$$_FinishedCopyWith<$Res> {
  __$$_FinishedCopyWithImpl(
      _$_Finished _value, $Res Function(_$_Finished) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? successfullyFinished = null,
  }) {
    return _then(_$_Finished(
      freezed == error ? _value.error : error,
      null == successfullyFinished
          ? _value.successfullyFinished
          : successfullyFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Finished implements _Finished {
  const _$_Finished(this.error, this.successfullyFinished);

  @override
  final Object? error;
  @override
  final bool successfullyFinished;

  @override
  String toString() {
    return 'RegistrationState.finished(error: $error, successfullyFinished: $successfullyFinished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Finished &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.successfullyFinished, successfullyFinished) ||
                other.successfullyFinished == successfullyFinished));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(error), successfullyFinished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinishedCopyWith<_$_Finished> get copyWith =>
      __$$_FinishedCopyWithImpl<_$_Finished>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object? error, bool successfullyFinished)
        finished,
    required TResult Function(bool visibility) passwordVisibility,
  }) {
    return finished(error, successfullyFinished);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object? error, bool successfullyFinished)? finished,
    TResult? Function(bool visibility)? passwordVisibility,
  }) {
    return finished?.call(error, successfullyFinished);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object? error, bool successfullyFinished)? finished,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(error, successfullyFinished);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_PasswordVisibilityState value)
        passwordVisibility,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_PasswordVisibilityState value)? passwordVisibility,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_PasswordVisibilityState value)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements RegistrationState {
  const factory _Finished(
      final Object? error, final bool successfullyFinished) = _$_Finished;

  Object? get error;
  bool get successfullyFinished;
  @JsonKey(ignore: true)
  _$$_FinishedCopyWith<_$_Finished> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordVisibilityStateCopyWith<$Res> {
  factory _$$_PasswordVisibilityStateCopyWith(_$_PasswordVisibilityState value,
          $Res Function(_$_PasswordVisibilityState) then) =
      __$$_PasswordVisibilityStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool visibility});
}

/// @nodoc
class __$$_PasswordVisibilityStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$_PasswordVisibilityState>
    implements _$$_PasswordVisibilityStateCopyWith<$Res> {
  __$$_PasswordVisibilityStateCopyWithImpl(_$_PasswordVisibilityState _value,
      $Res Function(_$_PasswordVisibilityState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibility = null,
  }) {
    return _then(_$_PasswordVisibilityState(
      null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PasswordVisibilityState implements _PasswordVisibilityState {
  const _$_PasswordVisibilityState(this.visibility);

  @override
  final bool visibility;

  @override
  String toString() {
    return 'RegistrationState.passwordVisibility(visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordVisibilityState &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, visibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordVisibilityStateCopyWith<_$_PasswordVisibilityState>
      get copyWith =>
          __$$_PasswordVisibilityStateCopyWithImpl<_$_PasswordVisibilityState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object? error, bool successfullyFinished)
        finished,
    required TResult Function(bool visibility) passwordVisibility,
  }) {
    return passwordVisibility(visibility);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object? error, bool successfullyFinished)? finished,
    TResult? Function(bool visibility)? passwordVisibility,
  }) {
    return passwordVisibility?.call(visibility);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object? error, bool successfullyFinished)? finished,
    TResult Function(bool visibility)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (passwordVisibility != null) {
      return passwordVisibility(visibility);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_PasswordVisibilityState value)
        passwordVisibility,
  }) {
    return passwordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_PasswordVisibilityState value)? passwordVisibility,
  }) {
    return passwordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_PasswordVisibilityState value)? passwordVisibility,
    required TResult orElse(),
  }) {
    if (passwordVisibility != null) {
      return passwordVisibility(this);
    }
    return orElse();
  }
}

abstract class _PasswordVisibilityState implements RegistrationState {
  const factory _PasswordVisibilityState(final bool visibility) =
      _$_PasswordVisibilityState;

  bool get visibility;
  @JsonKey(ignore: true)
  _$$_PasswordVisibilityStateCopyWith<_$_PasswordVisibilityState>
      get copyWith => throw _privateConstructorUsedError;
}
