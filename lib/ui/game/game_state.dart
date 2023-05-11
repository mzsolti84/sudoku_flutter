import "package:flutter/material.dart";
import "package:sudoku_flutter/domain/interactor/game_action.dart";
import "package:sudoku_flutter/domain/model/game_user.dart";

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GamePuzzleLoading extends GameState {}

class GameInitialWithFixPuzzle extends GameState {
  final List<int> puzzle;
  final List<int> solvedPuzzle;

  GameInitialWithFixPuzzle(this.puzzle, this.solvedPuzzle);

}

class GameNewGameState extends GameState {
  final List<int> puzzle;
  final List<int> solvedPuzzle;
  final bool isFromNetwork;

  GameNewGameState(this.puzzle, this.solvedPuzzle, this.isFromNetwork);
}

class GameLoadedUser extends GameState {
  final GameUser? user;
  final bool isAnonymus;

  GameLoadedUser(this.user, this.isAnonymus);
}

class GameUpdate extends GameState {
  final PuzzleErrorCode errorCode;
  final int? hitNumber;

  GameUpdate(this.errorCode, this.hitNumber);
}