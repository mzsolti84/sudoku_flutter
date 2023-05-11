
import 'package:sudoku_flutter/domain/interactor/position.dart';

class FixPositions {
  final List<List<int>> _puzzle;
  final List<Position> _fix;

  FixPositions._(this._puzzle, this._fix);

  factory FixPositions.fromMatrix(List<List<int>> puzzle) {
    final List<Position> list = List.empty(growable: true);
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (puzzle[row][col] != 0) list.add(Position(row * 9 + col));
      }
    }
    return FixPositions._(puzzle, list);
  }

  factory FixPositions(List<int> puzzle) {
    int arrayIndex = 0;
    final List<List<int>> m = List.generate(9, (_) => List.generate(9, (_) => 0));
    final List<Position> list = List.empty(growable: true);

    for (int row = 0; row < 9; row++) {
      for (int column = 0; column < 9; column++) {
        m[row][column] = puzzle[arrayIndex];
        arrayIndex++;
      }
    }

    for (int i = 0; i < puzzle.length; i++) {
      if (puzzle[i] != 0) list.add(Position(i));
    }

    return FixPositions._(m, list);
  }

  List<Position> get fixList => _fix;

  bool isInTheFixList(Position find) {
    for (var element in _fix) {
      if (element.index == find.index) return true;
    }
    return false;
  }

  @override
  String toString() {
    return 'FixPositions{: $_fix}';
  }
}
