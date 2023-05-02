class Matrix<T> {
  final int rows; // sorok száma
  final int cols; // oszlopok száma
  List<List<T>> _data;

  List<List<T>> get getData => _data;

  set setData(List<List<T>> value) {
    _data = value;
  }

  Matrix({required this.rows, required this.cols})
      : _data = List.generate(
          rows,
          (i) => List.filled(cols, 0 as T, growable: false),
          growable: false,
        );

  void put({required int row, required int col, required T value}) {
    if (row < 0 || row >= rows || col < 0 || col >= cols) {
      throw RangeError("Érvénytelen sor vagy oszlop index");
    }
    _data[row][col] = value;
  }

  T get({required int row, required int col}) {
    if (row < 0 || row >= rows || col < 0 || col >= cols) {
      throw RangeError("Érvénytelen sor vagy oszlop index");
    }
    return _data[row][col];
  }

  List<T> getFlatList() {
    final List<T> output = [];
    for(var rows in _data) {
      for(var value in rows) {
        output.add(value);
      }
    }
    return output;
  }

  @override
  String toString() {
    String output = "\n";
    for(var m in _data) {
      output = "$output$m\n";
    }
    return "Matrix:$output";
  }

}
