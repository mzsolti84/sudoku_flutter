import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/inject.dart';
import '../../domain/model/game_user.dart';
import '../../main.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameHomePage extends StatelessWidget {
  final String title;
  final String? uid;

  const GameHomePage({Key? key, required this.title, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GameBloc>()..add(GameGetUserUidEvent(FirebaseAuth.instance.currentUser?.uid)),
      child: GameHomeContent(
        title: title,
        uid: uid,
      ),
    );
  }
}

class GameHomeContent extends StatefulWidget {
  final String title;
  final String? uid;

  const GameHomeContent({super.key, required this.title, required this.uid});

  @override
  State<GameHomeContent> createState() => _GameHomeContentState();
}

class _GameHomeContentState extends State<GameHomeContent> {
  var list = List.generate(81, (index) => 0);
  GameUser? currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GameNewGameState) {
            list = state.puzzle;
          }
          else if (state is GameLoadedUser) {
            currentUser = state.user;
          }
          return Column(
            children: [
              currentUser!= null ? Text('Szia ${currentUser?.firstName}!') : const Text('Szia!'),
              const SizedBox(height: 16),
              SizedBox(
                height: 576,
                width: 576,
                child: GridView.count(
                  crossAxisCount: 9,
                  children: List.generate(
                    81,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(32, 32),
                          ),
                          onPressed: () {},
                          child: Text(
                            "${list[index]}",
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('New'),
                onPressed: () {
                  context.read<GameBloc>().add(GameNewGameEvent());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
