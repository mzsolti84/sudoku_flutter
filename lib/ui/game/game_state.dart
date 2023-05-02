import "package:flutter/material.dart";
import "package:sudoku_flutter/domain/model/game_user.dart";

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GamePuzzleLoading extends GameState {}

class GameNewGameState extends GameState {
  final List<int> puzzle;

  GameNewGameState(this.puzzle);
}

class GameLoadedUser extends GameState {
  final GameUser? user;
  final bool isAnonymus;

  GameLoadedUser(this.user, this.isAnonymus);
}