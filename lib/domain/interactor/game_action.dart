import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'position.dart';
import 'fix_position.dart';
import 'moves.dart';

class GameAction {
  Position selectedPosition = Position.init();
  List<int> _mainPuzzle = List.generate(81, (_) => 0);
  List<int> _solvedPuzzle = List.generate(81, (_) => 0);

  final Moves moves = Moves();
  FixPositions fixPositions = FixPositions(List.generate(81, (_) => 0));

  GameAction();

  void init() {

  }

  void reInitPuzzle(List<int> puzzle, List<int> solvedPuzzle) {
    _mainPuzzle = List.from(puzzle);
    _solvedPuzzle = List.from(solvedPuzzle);
    fixPositions = FixPositions(puzzle);
  }

  bool _isNotEmpty(Position position) {
    return _mainPuzzle[position.index] != 0;
  }

  PuzzleErrorCode updateValue(int value) {
    if (!fixPositions.isInTheFixList(selectedPosition)) {
      _mainPuzzle[selectedPosition.index] = value;
      moves.add(selectedPosition);
      return PuzzleErrorCode.none;
    } else {
      return PuzzleErrorCode.invalidUpdate;
    }
  }

  PuzzleErrorCode deleteValue() {
    if (_isNotEmpty(selectedPosition) &&
        !fixPositions.isInTheFixList(selectedPosition)) {
      updateValue(0);
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

  bool isHighlightedValue(int index) {
    final int currentRow = Position(index).row;
    final int selectedRow = selectedPosition.row;
    final int currentCol = Position(index).col;
    final int selectedCol = selectedPosition.col;
    final int currentBlock = (((index ~/ 9) ~/ 3) * 3) + ((index % 9) ~/ 3);
    final int selectedBlock = (((selectedPosition.index ~/ 9) ~/ 3) * 3) +
        ((selectedPosition.index % 9) ~/ 3);

    if (currentRow == selectedRow ||
        currentCol == selectedCol ||
        currentBlock == selectedBlock) {
      return true;
    } else {
      return false;
    }
  }

  List<int> _getPossibleNumbersInRow(Position index) {
    final int row = index.row;
    List<Position> steps = List.from(moves.moves);
    steps.addAll(fixPositions.fixList);
    List<int> result = List.generate(9, (index) => index + 1);

    for (var step in steps) {
      if (step.row == row) {
        result.remove(getCellValue(step.index));
      }
    }
    debugPrint('In row: ${result.toString()}');
    return result;
  }

  List<int> _getPossibleNumbersInCol(Position index) {
    final int col = index.col;
    List<Position> steps = List.from(moves.moves);
    steps.addAll(fixPositions.fixList);
    List<int> result = List.generate(9, (index) => index + 1);

    for (var step in steps) {
      if (step.col == col) {
        result.remove(getCellValue(step.index));
      }
    }
    debugPrint('In col: ${result.toString()}');
    return result;
  }

  List<int> _getPossibleNumbersInBlock(Position position) {
    final int currentBlock =
        (((position.index ~/ 9) ~/ 3) * 3) + ((position.index % 9) ~/ 3);
    // final int rowStart = (currentBlock ~/ 3) * 3;
    // final int columnStart = (currentBlock % 3) * 3;
    // debugPrint('Block: $currentBlock, $rowStart, $columnStart');
    List<Position> steps = List.from(moves.moves);
    steps.addAll(fixPositions.fixList);
    List<int> result = List.generate(9, (index) => index + 1);

    for (var step in steps) {
      int block = (((step.index ~/ 9) ~/ 3) * 3) + ((step.index % 9) ~/ 3);
      if (block == currentBlock) {
        result.remove(getCellValue(step.index));
      }
    }
    debugPrint('In block: ${result.toString()}');
    return result;
  }

  List<int> getPossibleNumbers(Position position) {
    final possibleNumbersInRow = _getPossibleNumbersInRow(position);
    final possibleNumbersInCol = _getPossibleNumbersInCol(position);
    final possibleNumbersInBlock = _getPossibleNumbersInBlock(position);
    List<int> result = possibleNumbersInRow
        .where((element) => possibleNumbersInCol.contains(element))
        .where((element) => possibleNumbersInBlock.contains(element))
        .toList();

    debugPrint('Full: ${result.toString()}');
    return result;
  }

  PuzzleErrorCode isContainsWrongValue(int value) {
    final possibleNumbers = getPossibleNumbers(selectedPosition);
    debugPrint('Numbers: ${possibleNumbers.toString()}');
    debugPrint('Selected: ${value.toString()}');
    for (var number in possibleNumbers) {
      if (value == number) return PuzzleErrorCode.okNumber;
    }
    return PuzzleErrorCode.invalidNumber;
  }

  int hit(Position position) {
    if (!_isNotEmpty(position)) {
      return _solvedPuzzle[position.index];
    }
    return -1;
  }

  PuzzleErrorCode isSolved() {
    var isSolved = listEquals(_mainPuzzle, _solvedPuzzle);
    if (isSolved) {
      return PuzzleErrorCode.none;
    }
    return PuzzleErrorCode.invalidSolution;
  }
}

enum PuzzleErrorCode {
  none(0, ''),
  invalidDelete(91, 'Ezt a számot nem te írtad be!'),
  notingDelete(92, 'Üres cella!'),
  canNotUndo(93, 'Nincs mit visszavonni!'),
  invalidUpdate(94, 'Ez a szám nem írható át!'),
  invalidNumber(95, 'Ez a szám a sudoku szabályi szerint nem írható ide!'),
  invalidHit(96, 'Itt már van egy szám!'),
  invalidSolution(97, 'Ez nem egy helyes megoldás vagy nincs minden üres cella kitöltve!'),
  okNumber(99, ''),
  okHit(101, '');

  final int errorCode;
  final String message;

  const PuzzleErrorCode(this.errorCode, this.message);
}
