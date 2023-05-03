import 'package:flutter/material.dart';
import 'package:sudoku_flutter/ui/game/position.dart';

import 'moves.dart';

class SudokuUI extends StatefulWidget {
  const SudokuUI({super.key});

  @override
  State<SudokuUI> createState() => _SudokuUIState();
}

class _SudokuUIState extends State<SudokuUI> {
  Position _selectedPosition = Position.init();
  late final List<List<int>> _mainPuzzle;
  late final Moves _moves;

  @override
  void initState() {
    super.initState();
    _mainPuzzle = List.generate(
      9,
      (_) => List.generate(9, (_) => 0),
    );
    _moves = Moves();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku'),
      ),
      body: Center(
        child: SizedBox(
          height: 576,
          width: 576,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
                childAspectRatio: 1.0,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemCount: 81,
              itemBuilder: (context, index) {
                final position = Position(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPosition = Position(index);
                    });
                    // Show the number pad widget in the bottom app bar
                    Scaffold.of(context).showBottomSheet(
                      (context) => _buildNumberPadWidget(),
                      backgroundColor: Colors.white.withOpacity(0.65),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedPosition.index == index
                          ? Theme.of(context).primaryColor.withOpacity(0.5)
                          : Colors.transparent,
                      border: Border.all(
                        color: _selectedPosition.index == index
                            ? Colors.blueAccent
                            : Colors.black,
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _mainPuzzle[position.row][position.col] == 0
                            ? ''
                            : '${_mainPuzzle[position.row][position.col]}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                if (!_isEmpty(_selectedPosition)) {
                  _updateValue(_selectedPosition, 0);
                  _moves.remove(_selectedPosition);
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {
                _undo();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isEmpty(Position position) {
    return _mainPuzzle[position.row][position.col] == 0;
  }

  void _updateValue(Position position, int value) {
    setState(() {
      _mainPuzzle[position.row][position.col] = value;
      _moves.add(position);
      debugPrint(_moves.moves.toString());
      debugPrint(_moves.total.toString());
      debugPrint(_moves.lastPosition.toString());
    });
  }

  void _undo() {
    setState(() {
      Position? last = _moves.undoLastMove();
      debugPrint('Last position ${last.toString()}');
      if (last != null) {
        _mainPuzzle[last.row][last.col] = 0;
      }
    });
  }

  // Build the number pad widget
  Widget _buildNumberPadWidget() {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          for (int row = 0; row < 3; row++)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int col = 0; col < 3; col++)
                    GestureDetector(
                      onTap: () {
                        _updateValue(_selectedPosition, (row * 3 + col + 1));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        constraints:
                            const BoxConstraints(maxWidth: 64, minHeight: 64),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            '${(row * 3 + col + 1)}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
