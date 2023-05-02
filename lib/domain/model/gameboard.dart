class Gameboard {
  final List<int> initPuzzle;
  final List<int> solvedPuzzle;
  final int numberOfFreeSpaces;
  final Level level;

  Gameboard(
      {required this.initPuzzle,
      required this.solvedPuzzle,
      required this.numberOfFreeSpaces,
      required this.level});
}

enum Level { beginner, easy, intermediate, hard }
