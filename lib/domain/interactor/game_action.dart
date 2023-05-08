import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'position.dart';
import 'fix_position.dart';
import 'moves.dart';

@lazySingleton
class GameAction {
  Position selectedPosition = Position.init();
  List<int> _mainPuzzle = List.generate(81, (_) => 0);

  final Moves moves = Moves();
  FixPositions fixPositions  = FixPositions(List.generate(81, (_) => 0));

  GameAction();

  void init() {
    // _mainPuzzle[0] = 1;
    // _mainPuzzle[20] = 2;
    // _mainPuzzle[80] = 3;
    // fixPositions = FixPositions(mainPuzzle);
    // moves = Moves();
  }

  bool _isNotEmpty(Position position) {
    return _mainPuzzle[position.index] != 0;
  }

  PuzzleErrorCode updateValue(Position position, int value) {
    if (!fixPositions.isInTheFixList(selectedPosition)) {
      _mainPuzzle[position.index] = value;
      moves.add(position);
      return PuzzleErrorCode.none;
    } else {
      return PuzzleErrorCode.invalidUpdate;
    }
  }

  PuzzleErrorCode deleteValue() {
    if (_isNotEmpty(selectedPosition) &&
        !fixPositions.isInTheFixList(selectedPosition)) {
      updateValue(selectedPosition, 0);
      moves.remove(selectedPosition);
    } else if (fixPositions.isInTheFixList(selectedPosition)) {
      return PuzzleErrorCode.invalidDelete;
    } else if (!_isNotEmpty(selectedPosition)) {
      return PuzzleErrorCode.notingDelete;
    }
    return PuzzleErrorCode.none;
  }

  PuzzleErrorCode undo() {
      Position? last = moves.undoLastMove();
      if (last != null) {
        _mainPuzzle[last.index] = 0;
        return PuzzleErrorCode.none;
      }
      return PuzzleErrorCode.canNotUndo;
  }

  int getCellValue(int index) => _mainPuzzle[index];

  List<int> get mainPuzzle => _mainPuzzle;

  set mainPuzzle(List<int> value) {
    _mainPuzzle = value;
  }

  void reInitPuzzle(List<int> value) {
    _mainPuzzle = value;
    fixPositions  = FixPositions(value);
  }
}

enum PuzzleErrorCode {
  none(0, ''),
  invalidDelete(1, 'Ezt a számot nem te írtad be!'),
  notingDelete(2, 'Üres cella!'),
  canNotUndo(3, 'Nincs mit visszavonni!'),
  invalidUpdate(4, 'Ez a szám nem írható át!');

  final int errorCode;
  final String message;

  const PuzzleErrorCode(this.errorCode, this.message);

}
