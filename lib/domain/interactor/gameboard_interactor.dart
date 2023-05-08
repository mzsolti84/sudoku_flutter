import 'package:injectable/injectable.dart';

import '../../data/gameboard/remote_gameboard_data_source.dart';
import '../model/gameboard.dart';

@lazySingleton
class GameboardInteractor {
  final RemoteGameboardDataSource _remoteGameboardDataSource;

  GameboardInteractor(this._remoteGameboardDataSource);

  Future<Gameboard> fetchInitialPuzzle() async {
    List<int> initialPuzzle =
        await _remoteGameboardDataSource.fetchInitialPuzzle();
    return Gameboard(
        initPuzzle: initialPuzzle,
        solvedPuzzle: [],
        level: Level.intermediate);
  }

  Future<Gameboard> fetchFixPuzzle() async {
    List<int> initialPuzzle = [
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      2,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      3,
    ];
    return Gameboard(
        initPuzzle: initialPuzzle,
        solvedPuzzle: [],
        level: Level.intermediate);
  }
}
