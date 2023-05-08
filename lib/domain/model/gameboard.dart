class Gameboard {
  final List<int> initPuzzle;
  final List<int> solvedPuzzle;
  final int numberOfFreeSpaces;
  final Level level;

  Gameboard._({required this.initPuzzle,
    required this.solvedPuzzle,
    required this.numberOfFreeSpaces,
    required this.level});


factory Gameboard({required List<int> initPuzzle,
  required List<int> solvedPuzzle,
  required Level level}) {
  return Gameboard._(initPuzzle: initPuzzle, solvedPuzzle: solvedPuzzle, numberOfFreeSpaces: level.value, level: level);
}

}

enum Level {
  beginner(value: 15),
  easy(value: 21),
  intermediate(value: 34),
  hard(value: 54);

  const Level({required this.value});

  final int value;
}
