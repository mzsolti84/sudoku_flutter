
import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/data/firestone/firestone_data_source.dart';

import '../model/game_user.dart';

@lazySingleton
class GameUserInteractor {
  final FirestoneDataSource _firestoneDataSource;

  GameUserInteractor(this._firestoneDataSource);

  Stream<List<GameUser>> findAllUser() {
    return _firestoneDataSource.findAllUser();
  }

  Future<GameUser?> findUserByUid(String uid) {
    return _firestoneDataSource.findUserByUid(uid);
  }

  Future<int> getUserCount() async {
    return await findAllUser().length;
  }
}

