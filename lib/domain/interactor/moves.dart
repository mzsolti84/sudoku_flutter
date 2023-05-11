/*
 * Copyright (c) 2023. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:sudoku_flutter/domain/interactor/position.dart';

class Moves {
  final List<Position> _moves;

  Moves() : _moves = List.empty(growable: true);

  List<Position> get moves => _moves;

  Position get lastPosition => _moves[_moves.length -1];

  int get total => _moves.length;

  bool canUndo() {
    return _moves.isNotEmpty;
  }

  void add(Position position) {
    _moves.add(position);
  }

  void remove(Position position) {
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
