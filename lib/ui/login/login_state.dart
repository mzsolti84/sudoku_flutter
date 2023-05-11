part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInput extends LoginState {
  const LoginInput();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginFinished extends LoginState {
  final Object? error;
  final bool successfullyFinished;
  final String? uid;

  const LoginFinished(this.error, this.successfullyFinished, this.uid);
}

class LoginLogoutFinished extends LoginState {
}

class LoginPasswordVisibility extends LoginState {
  final bool visibility;

  const LoginPasswordVisibility([this.visibility = false]);
}

class LoginRegisterStart extends LoginState {
  const LoginRegisterStart();
}
