import "dart:async";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/material.dart";
import "package:sudoku_flutter/firebase_options.dart";
import "package:sudoku_flutter/ui/main_app.dart";
import "di/inject.dart";
import "domain/gameboard/matrix.dart";


Matrix<int> matrix = Matrix<int>(rows: 9, cols: 9);

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      await configureDependencies();
      // Generate Example
      // var sudokuGenerator = SudokuGenerator(emptySquares: 54);
      // SudokuUtilities.printSudoku(sudokuGenerator.newSudoku);
      // matrix.setData = sudokuGenerator.newSudoku;
      // print(''); // ignore: avoid_print
      // SudokuUtilities.printSudoku(sudokuGenerator.newSudokuSolved);

      runApp(const MainApp());
    },
    (error, stack) => FirebaseCrashlytics.instance
        .recordError(error, stack, printDetails: true),
  );
}
