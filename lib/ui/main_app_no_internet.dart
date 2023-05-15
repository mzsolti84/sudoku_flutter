import 'package:flutter/material.dart';

class MainAppNoInternet extends StatelessWidget {
  const MainAppNoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sudoku',
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Nincs internet elérhetőség!',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Az alkalmazás internet nélkül nem használható!',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
