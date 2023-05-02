// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sudoku_flutter/data/authentication/authetication_data_source.dart'
    as _i4;
import 'package:sudoku_flutter/data/firestone/firestone_data_source.dart'
    as _i6;
import 'package:sudoku_flutter/data/gameboard/remote_gameboard_data_source.dart'
    as _i10;
import 'package:sudoku_flutter/di/module/network_module.dart' as _i14;
import 'package:sudoku_flutter/domain/interactor/game_user_interactor.dart'
    as _i7;
import 'package:sudoku_flutter/domain/interactor/gameboard_interactor.dart'
    as _i11;
import 'package:sudoku_flutter/domain/interactor/login_interactor.dart' as _i8;
import 'package:sudoku_flutter/environment.dart' as _i3;
import 'package:sudoku_flutter/ui/game/game_bloc.dart' as _i13;
import 'package:sudoku_flutter/ui/login/login_bloc.dart' as _i12;
import 'package:sudoku_flutter/ui/registration/registration_bloc.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.AppEnvironment>(_i3.DevEnvironment());
    gh.lazySingleton<_i4.AuthenticationDataSource>(
        () => _i4.AuthenticationDataSource());
    gh.singleton<_i5.Dio>(networkModule.dio(gh<_i3.AppEnvironment>()));
    gh.lazySingleton<_i6.FirestoneDataSource>(() => _i6.FirestoneDataSource());
    gh.lazySingleton<_i7.GameUserInteractor>(
        () => _i7.GameUserInteractor(gh<_i6.FirestoneDataSource>()));
    gh.singleton<_i8.LoginInteractor>(_i8.LoginInteractor(
      gh<_i4.AuthenticationDataSource>(),
      gh<_i6.FirestoneDataSource>(),
    ));
    gh.factory<_i9.RegistrationBloc>(
        () => _i9.RegistrationBloc(gh<_i8.LoginInteractor>()));
    gh.factory<_i10.RemoteGameboardDataSource>(
        () => _i10.RemoteGameboardDataSource(gh<_i5.Dio>()));
    gh.lazySingleton<_i11.GameboardInteractor>(
        () => _i11.GameboardInteractor(gh<_i10.RemoteGameboardDataSource>()));
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc(gh<_i8.LoginInteractor>()));
    gh.factory<_i13.GameBloc>(() => _i13.GameBloc(
          gh<_i11.GameboardInteractor>(),
          gh<_i7.GameUserInteractor>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i14.NetworkModule {}
