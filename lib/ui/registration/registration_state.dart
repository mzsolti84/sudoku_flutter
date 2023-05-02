part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;

  const factory RegistrationState.finished(
      Object? error, bool successfullyFinished) = _Finished;

  const factory RegistrationState.passwordVisibility(bool visibility) =
      _PasswordVisibilityState;
}
