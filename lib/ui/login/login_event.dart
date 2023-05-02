part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginStartLoginEvent extends LoginEvent{
  final String email;
  final String password;

  LoginStartLoginEvent(this.email, this.password);
}

class LoginStartLoginAnonymouslyEvent extends LoginEvent{

  LoginStartLoginAnonymouslyEvent();
}

class LoginTryAutoLoginEvent extends LoginEvent {}

class LoginSingInEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSingInEvent(this.email, this.password);
}

class LoginRegisterStartEvent extends LoginEvent {

}

class LoginVisibilityEvent extends LoginEvent {
  final bool visibility;

  LoginVisibilityEvent(this.visibility);
}

