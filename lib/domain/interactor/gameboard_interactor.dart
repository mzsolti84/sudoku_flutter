import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/domain/gameboard/inmemory_puzzles.dart';

import '../../data/gameboard/remote_gameboard_data_source.dart';
import '../model/gameboard.dart';

@lazySingleton
class GameboardInteractor {
  final RemoteGameboardDataSource _remoteGameboardDataSource;

  GameboardInteractor(this._remoteGameboardDataSource);

  Future<Gameboard?> fetchPuzzle(int index) async {
    Gameboard? initialPuzzle =
        await _remoteGameboardDataSource.fetchPuzzle(index);

    return initialPuzzle;
  }

  Future<Gameboard> fetchFixPuzzle() async {
    return Gameboard.from(InMemoryPuzzles.randomPuzzles[0]);
  }
}
