part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.register(
          String email, String password, String firstName, String lastName, int age) =
      _Register;

  const factory RegistrationEvent.registrationStared() = _RegistrationStared;

  const factory RegistrationEvent.passwordVisibility(bool visibility) =
      _PasswordVisibility;
}
