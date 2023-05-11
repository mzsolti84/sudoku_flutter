
class Position {
  final int _index;

  Position(this._index);

  Position.init() :
    _index = 1;

  int get index => _index;

  int get row {
    if (_index == -1) {
      return -1;
    }
    return _index ~/ 9;
  }

  int get col {
    if (_index == -1) {
      return -1;
    }
    return _index % 9;
  }

  @override
  String toString() {
    return 'Position: {index: $index, row: $row, col: $col}';
  }
}