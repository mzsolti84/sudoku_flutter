import "dart:async";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/material.dart";
import "package:sudoku_flutter/firebase_options.dart";
import "package:sudoku_flutter/ui/main_app.dart";

import "di/inject.dart";

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // final connectivityResult = await Connectivity().checkConnectivity();
        await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform);
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      await configureDependencies();

      runApp(const MainApp());
    },
    (error, stack) => FirebaseCrashlytics.instance
        .recordError(error, stack, printDetails: true),
  );
}
