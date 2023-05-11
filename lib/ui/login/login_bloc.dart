import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/interactor/login_interactor.dart';

part 'login_event.dart';

part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginInteractor _loginInteractor;

  LoginBloc(this._loginInteractor) : super(const LoginInput()) {
    on<LoginStartLoginEvent>((event, emit) async {
      emit.call(const LoginLoading());
      try {
        String? uid =
            await _loginInteractor.loginUser(event.email, event.password);
        emit.call(LoginFinished(null, true, uid));
      } catch (e) {
        emit.call(LoginFinished(e, false, null));
      }
    });

    on<LoginStartLoginAnonymouslyEvent>((event, emit) async {
      emit.call(const LoginLoading());
      try {
        emit.call(const LoginFinished(null, true, null));
      } catch (e) {
        emit.call(LoginFinished(e, false, null));
      }
    });

    on<LoginLogoutEvent>((event, emit) async {
      if (!event.isAnonymus) {
        debugPrint('Logout user!');
        await _loginInteractor.logoutUser();
      }
      emit.call(LoginLogoutFinished());
    });

    on<LoginVisibilityEvent>((event, emit) {
      if (state is! LoginLoading) {
        emit.call(LoginPasswordVisibility(event.visibility));
      }
    });

    on<LoginRegisterStartEvent>((event, emit) {
      if (state is! LoginLoading) {
        emit.call(const LoginRegisterStart());
      }
    });

    on<LoginTryAutoLoginEvent>((event, emit) async {
      emit.call(const LoginLoading());
      Future.delayed(const Duration(seconds: 1));
      var successfulGottenId = await _loginInteractor.tryAutoLogin();
      if (successfulGottenId != null) {
        emit.call(LoginFinished(null, true, successfulGottenId));
      } else {
        emit.call(const LoginInput());
      }
    });

    add(LoginTryAutoLoginEvent());
  }
}
