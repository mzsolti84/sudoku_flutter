import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudoku_flutter/domain/interactor/game_action.dart';
import 'package:sudoku_flutter/ui/game/game_state.dart';
import 'package:sudoku_flutter/ui/widgets/custom_snackbar.dart';
import 'package:sudoku_flutter/domain/interactor/position.dart';
import '../../di/inject.dart';
import '../../domain/model/game_user.dart';
import 'game_bloc.dart';
import 'game_event.dart';

class SudokuUIPage extends StatelessWidget {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  SudokuUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GameBloc>()
        ..add(GameGetUserUidEvent(uid))
        ..add(GameNewGameWithFixPuzzleEvent()),
      child: const SudokuUI(),
    );
  }
}

class SudokuUI extends StatefulWidget {
  const SudokuUI({super.key});

  @override
  State<SudokuUI> createState() => _SudokuUIState();
}

class _SudokuUIState extends State<SudokuUI> {
  GameUser? currentUser;
  final GameAction gameAction = GameAction();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku'),
      ),
      body: BlocListener<GameBloc, GameState>(
        listener: (context, state) {
          if (state is GameUpdate) {
            if (state.errorCode != PuzzleErrorCode.none) {
              showCustomSnackBar(
                  buildContext: context, text: state.errorCode.message);
            }
          }
        },
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameNewGameState) {
              //_mainPuzzle = state.puzzle;
            }
            if (state is GameInitialWithFixPuzzle) {
              gameAction.reInitPuzzle(state.puzzle);
            } else if (state is GameLoadedUser) {
              currentUser = state.user;
            }
            return Center(
              child: Column(
                children: [
                  currentUser != null
                      ? Text('Szia ${currentUser?.firstName}!')
                      : const Text('Szia!'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 576,
                    width: 576,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 9,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                        ),
                        itemCount: 81,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                gameAction.selectedPosition = Position(index);
                              });
                              // Show the number pad widget in the bottom app bar
                              Scaffold.of(context).showBottomSheet(
                                (context) => _buildNumberPadWidget(),
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.75),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    gameAction.selectedPosition.index == index
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5)
                                        : Colors.transparent,
                                border: Border.all(
                                  color:
                                      gameAction.selectedPosition.index == index
                                          ? Colors.blueAccent
                                          : Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  gameAction.getCellValue(index) == 0
                                      ? ''
                                      : '${gameAction.getCellValue(index)}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                var errorCode = gameAction.deleteValue();
                context.read<GameBloc>().add(GameActionEvent(errorCode));
              },
            ),
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {
                var errorCode = gameAction.undo();
                context.read<GameBloc>().add(GameActionEvent(errorCode));
              },
            ),
          ],
        ),
      ),
    );
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
                        var selectedPosition = gameAction.selectedPosition;
                        var errorCode = gameAction.updateValue(
                            selectedPosition, (row * 3 + col + 1));
                        Navigator.of(context).pop();

                        context.read<GameBloc>().add(GameActionEvent(errorCode));
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
