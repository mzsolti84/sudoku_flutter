import "package:flutter/material.dart";
import "package:sudoku_flutter/domain/interactor/game_action.dart";

@immutable
abstract class GameEvent {}

class GameNewGameEvent extends GameEvent {
}

class GameNewGameWithFixPuzzleEvent extends GameEvent {
}

class GameGetUserUidEvent extends GameEvent {
  final String? uid;

  GameGetUserUidEvent(this.uid);
}

class GameActionEvent extends GameEvent {
  final PuzzleErrorCode errorCode;

  GameActionEvent(this.errorCode);

}