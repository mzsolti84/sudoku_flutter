import 'package:sudoku_flutter/ui/game/position.dart';

class Moves {
  final List<Position> _moves;

  Moves() : _moves = List.empty(growable: true);

  List<Position> get moves => _moves;

  Position get lastPosition => _moves[_moves.length -1];

  int get total => _moves.length;

  bool canUndo() {
    return _moves.isNotEmpty;
  }

  void add (Position position) {
    _moves.add(position);
  }

  void remove (Position position) {
    _moves.remove(position);
  }

  Position? undoLastMove() {
    var total = _moves.length;
    if (canUndo()) {
      Position last = lastPosition;
      _moves.removeAt(total - 1);
      return last;
    } else {
      return null;
    }
  }
}
