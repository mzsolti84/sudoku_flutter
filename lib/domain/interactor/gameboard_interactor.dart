
import 'package:injectable/injectable.dart';

import '../../data/gameboard/remote_gameboard_data_source.dart';
import '../model/gameboard.dart';

@lazySingleton
class GameboardInteractor {
  final RemoteGameboardDataSource _remoteGameboardDataSource;

  GameboardInteractor(this._remoteGameboardDataSource);


  Future<Gameboard> fetchInitialPuzzle() async {
    List<int> initialPuzzle = await _remoteGameboardDataSource.fetchInitialPuzzle();
    return Gameboard(initPuzzle: initialPuzzle, solvedPuzzle: [], numberOfFreeSpaces: 34, level: Level.intermediate);
  }

}