class Matrix<T> {
  int rows; // sorok száma
  int cols; // oszlopok száma
  List<List<T>> data; // mátrix adattartalma

  Matrix({required this.rows, required this.cols})
      : data = List.generate(
          rows,
          (i) => List.filled(cols, 0 as T, growable: false),
          growable: false,
        );

  void put({required int row, required int col, required T value}) {
    if (row < 0 || row >= rows || col < 0 || col >= cols) {
      throw RangeError("Érvénytelen sor vagy oszlop index");
    }
    data[row][col] = value;
  }

  T get({required int row, required int col}) {
    if (row < 0 || row >= rows || col < 0 || col >= cols) {
      throw RangeError("Érvénytelen sor vagy oszlop index");
    }
    return data[row][col];
  }

  @override
  String toString() {
    String output = "\n";
    for(var m in data) {
      output = "$output$m\n";
    }
    return "Matrix:$output";
  }
}
