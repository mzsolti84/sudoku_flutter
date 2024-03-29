// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBsqGBw258uLwvTBFUWEacBZmQirf39Dr8',
    appId: '1:159419806525:web:53f7a221a6896539548b54',
    messagingSenderId: '159419806525',
    projectId: 'flutter-sudoku-8d568',
    authDomain: 'flutter-sudoku-8d568.firebaseapp.com',
    storageBucket: 'flutter-sudoku-8d568.appspot.com',
    measurementId: 'G-E8G6W4EDRC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzoyj4kvxfkPVVlwLFkifRA6-LV39u6LU',
    appId: '1:159419806525:android:cb606abcd4f7565f548b54',
    messagingSenderId: '159419806525',
    projectId: 'flutter-sudoku-8d568',
    storageBucket: 'flutter-sudoku-8d568.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVPwg4x7bidjAZbJSYRZ-aJewCOHbIb20',
    appId: '1:159419806525:ios:741104149d8f5742548b54',
    messagingSenderId: '159419806525',
    projectId: 'flutter-sudoku-8d568',
    storageBucket: 'flutter-sudoku-8d568.appspot.com',
    iosClientId: '159419806525-e2jn0janjg5rggabboiu1dl6g2ndt7le.apps.googleusercontent.com',
    iosBundleId: 'hu.molnarzs.sudokuFlutter',
  );
}
