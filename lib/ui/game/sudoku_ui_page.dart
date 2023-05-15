import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sudoku_flutter/domain/interactor/game_action.dart';
import 'package:sudoku_flutter/ui/game/game_state.dart';
import 'package:sudoku_flutter/ui/login/login_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GameBloc>()
            ..add(GameGetUserUidEvent(uid))
            ..add(GameNewGameWithFixPuzzleEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
      ],
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
  String gameLevel = 'Nagyon nehéz';
  final GameAction gameAction = GameAction();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Sudoku'),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginLogoutEvent(currentUser == null ? true : false),
                      );
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
          body: BlocListener<GameBloc, GameState>(
            listener: (context, state) {
              if (state is GameNewGameState && !state.isFromNetwork) {
                showCustomSnackBar(
                  buildContext: context,
                  color: Colors.red,
                  durationMs: 2500,
                  text: 'Hálózati hiba! Fix puzzle került betöltésre!',
                );
              } else if (state is GameUpdate) {
                if (state.errorCode != PuzzleErrorCode.none &&
                    state.errorCode != PuzzleErrorCode.okNumber &&
                    state.errorCode != PuzzleErrorCode.okHit) {
                  showCustomSnackBar(
                      buildContext: context,
                      text: state.errorCode.message,
                      durationMs:
                          state.errorCode == PuzzleErrorCode.invalidNumber
                              ? 2200
                              : 1500);
                } else if (state.errorCode == PuzzleErrorCode.okHit) {
                  showCustomSnackBar(
                      buildContext: context,
                      color: Colors.red,
                      text: 'A keresett szám: ${state.hitNumber!}',
                      durationMs: 2500);
                }
              }
            },
            child: BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                if (state is GameNewGameState) {
                  gameAction.reInitPuzzle(state.puzzle, state.solvedPuzzle);
                }
                if (state is GameInitialWithFixPuzzle) {
                  gameAction.reInitPuzzle(state.puzzle, state.solvedPuzzle);
                } else if (state is GameLoadedUser) {
                  currentUser = state.user;
                }
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Játékszint: $gameLevel',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              currentUser != null
                                  ? 'Játékos: ${currentUser!.firstName}'
                                  : 'Játékos: Anonymus',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 576,
                          width: 576,
                          child: Stack(
                            children: [
                              if (state is GamePuzzleLoading)
                                const Center(
                                  child: SizedBox(
                                    width: 128,
                                    height: 128,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 8,
                                    ),
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black54,
                                    width: 4,
                                  ),
                                ),
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
                                    Position currentPosition = Position(index);
                                    Color textColor = gameAction.fixPositions
                                            .isInTheFixList(currentPosition)
                                        ? Colors.deepPurpleAccent
                                        : Colors.black;
                                    Color backgroundColor = Colors.transparent;
                                    if (gameAction.isHighlightedValue(index)) {
                                      backgroundColor = Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5);
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() =>
                                            gameAction.selectedPosition =
                                                Position(index));
                                        // Show the number pad widget in the bottom app bar
                                        Scaffold.of(context).showBottomSheet(
                                          (context) => _buildNumberPadWidget(),
                                          backgroundColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.75),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          AnimatedContainer(
                                            curve: Curves.easeInOutSine,
                                            duration: const Duration(
                                                milliseconds: 660),
                                            decoration: BoxDecoration(
                                              color: backgroundColor,
                                              border: Border.all(
                                                color: gameAction
                                                            .selectedPosition
                                                            .index ==
                                                        index
                                                    ? Colors.blueAccent
                                                    : Colors.black,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                gameAction.getCellValue(
                                                            index) ==
                                                        0
                                                    ? ''
                                                    : '${gameAction.getCellValue(index)}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: textColor),
                                              ),
                                            ),
                                          ),
                                          if ((currentPosition.col % 3) == 0 &&
                                              currentPosition.col != 8)
                                            Container(
                                              color: Colors.black54,
                                              width: 2.0,
                                              height: double.infinity,
                                            ),
                                          if ((currentPosition.row % 3) == 0 &&
                                              currentPosition.row != 8)
                                            Container(
                                              color: Colors.black54,
                                              width: double.infinity,
                                              height: 2.0,
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: 'Aktuális cellában szám törlése',
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        var errorCode = gameAction.deleteValue();
                        context
                            .read<GameBloc>()
                            .add(GameActionEvent(errorCode, null));
                      },
                    ),
                    IconButton(
                      tooltip: 'Visszavonás',
                      icon: const Icon(Icons.undo),
                      onPressed: () {
                        var errorCode = gameAction.undo();
                        context
                            .read<GameBloc>()
                            .add(GameActionEvent(errorCode, null));
                      },
                    ),
                    IconButton(
                      tooltip: 'Aktuális cellában megoldás mutatása',
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        int hitNumber =
                            gameAction.hit(gameAction.selectedPosition);
                        var errorCode = (hitNumber == -1
                            ? PuzzleErrorCode.invalidHit
                            : PuzzleErrorCode.noMoreHit);
                        context.read<GameBloc>().add(
                              GameActionEvent(
                                  hitNumber < 0
                                      ? errorCode
                                      : PuzzleErrorCode.okHit,
                                  hitNumber < 0 ? null : hitNumber),
                            );
                      },
                    ),
                    IconButton(
                      tooltip: 'Teljes puzzle ellenőrzése',
                      icon: const Icon(Icons.done_all),
                      onPressed: () {
                        var errorCode = gameAction.isSolved();
                        context
                            .read<GameBloc>()
                            .add(GameActionEvent(errorCode, null));
                      },
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      tooltip: 'Új játék',
                      icon: const Icon(Icons.fiber_new_rounded),
                      onPressed: () async {
                        int? newGameLevel = 2;
                        final levels = [
                          'Kezdő',
                          'Könnyű',
                          'Haladó',
                          'Nehéz',
                          'Nagyon nehéz'
                        ];
                        var ng = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            icon: const Icon(Icons.fiber_new_rounded),
                            title: const Text('Új játék'),
                            content: FormBuilder(
                              child: FormBuilderRadioGroup<int>(
                                onChanged: (value) {
                                  newGameLevel = value;
                                },
                                activeColor: Theme.of(context).primaryColor,
                                decoration: const InputDecoration(
                                  labelText: 'Nehézségi szint',
                                ),
                                initialValue: 2,
                                name: 'level',
                                options: levels
                                    .map((level) => FormBuilderFieldOption(
                                          value: levels.indexOf(level),
                                          child: Text(level),
                                        ))
                                    .toList(growable: false),
                                controlAffinity: ControlAffinity.trailing,
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Új játék',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Mégsem',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                              ),
                            ],
                          ),
                        );
                        if (context.mounted && (ng is bool) && ng) {
                          gameLevel = levels[newGameLevel!];
                          context.read<GameBloc>().add(
                                GameNewGameEvent(newGameLevel!),
                              );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build the number pad widget
  Widget _buildNumberPadWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 192,
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
                          var errorCode = gameAction
                              .isContainsWrongValue((row * 3 + col + 1));

                          var errorCodeUpdate =
                              gameAction.updateValue((row * 3 + col + 1));
                          Navigator.of(context).pop();

                          if (errorCodeUpdate != PuzzleErrorCode.none) {
                            errorCode = errorCodeUpdate;
                          }
                          context
                              .read<GameBloc>()
                              .add(GameActionEvent(errorCode, null));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 2),
                          child: SizedBox(
                            height: 60,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 56,
                                  width: 56,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${(row * 3 + col + 1)}',
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
