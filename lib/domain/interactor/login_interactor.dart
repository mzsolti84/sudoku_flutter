import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/data/authentication/authetication_data_source.dart';
import 'package:sudoku_flutter/data/firestone/firestone_data_source.dart';
import 'package:sudoku_flutter/domain/model/game_user.dart';

@singleton
class LoginInteractor {
  final AuthenticationDataSource _authenticationDataSource;
  final FirestoneDataSource _firestoneDataSource;

  LoginInteractor(this._authenticationDataSource, this._firestoneDataSource);

  Future<String> loginUser(String email, String password) {
    return _authenticationDataSource.login(email: email, password: password);
  }

  Future<String> loginUserAnonymously() {
    return _authenticationDataSource.loginAnonymously();
  }

  Future<String?> tryAutoLogin() => _authenticationDataSource.isUserLoggedIn();

  Future singUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required int age}) async {
    var id = await _authenticationDataSource.singUp(
        email: email, password: password);
    var user = GameUser(
        id: id, email: email, firstName: firstName, lastName: lastName, age: age);
    _firestoneDataSource.updateUsersCollection(user);
  }
}
