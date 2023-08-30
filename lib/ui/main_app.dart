import 'package:flutter/material.dart';
import 'package:sudoku_flutter/ui/game/sudoku_ui_page.dart';
import 'package:sudoku_flutter/ui/registration/registration.dart';

import 'login/login.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sudoku',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          },
        ),
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(140, 86, 73, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(248, 184, 7, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(140, 86, 73, 1),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color.fromRGBO(140, 86, 73, 0.85),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black87,
        scaffoldBackgroundColor: Colors.grey,
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(
        title: 'Sudoku',
      ),
      routes: {
        // '/home': (_) => const GameHomePage(title: 'Sudoku App'),
        '/register': (_) => const RegistrationPage(),
        '/login': (_) => const LoginPage(
              title: 'Sudoku',
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/sudokuUI') {
          return MaterialPageRoute(
            builder: (_) => SudokuUIPage(),
          );
        }
      },
    );
  }
}
