import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/domain/model/game_user.dart';

import '../../domain/interactor/login_interactor.dart';

part 'registration_event.dart';

part 'registration_state.dart';

part 'registration_bloc.freezed.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final LoginInteractor _loginInteractor;

  RegistrationBloc(this._loginInteractor)
      : super(const RegistrationState.initial()) {
    on<_PasswordVisibility>((event, emit) {
      emit.call(RegistrationState.passwordVisibility(event.visibility));
    });

    on<_Register>((event, emit) async {
      emit.call(const RegistrationState.initial());
      try {
        await _loginInteractor.singUp(
            email: event.email,
            password: event.password,
            firstName: event.firstName,
            lastName: event.lastName,
            age: event.age);
        emit.call(const RegistrationState.finished(null, true));
      } catch (e) {
        emit.call(RegistrationState.finished(e, false));
      }
    });
  }
}
