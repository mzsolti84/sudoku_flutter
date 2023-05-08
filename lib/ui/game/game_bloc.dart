import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/interactor/game_user_interactor.dart';
import '../../domain/interactor/gameboard_interactor.dart';
import 'game_event.dart';
import 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  final GameboardInteractor _gameboardInteractor;
  final GameUserInteractor _gameUserInteractor;

  GameBloc(this._gameboardInteractor, this._gameUserInteractor)
      : super(GameInitial()) {

    on<GameNewGameEvent>((event, emit) async {
      emit.call(GamePuzzleLoading());
      var newGameboard = await _gameboardInteractor.fetchInitialPuzzle();
      emit.call(GameNewGameState(newGameboard.initPuzzle));
    });

    on<GameNewGameWithFixPuzzleEvent>((event, emit) async {
      emit.call(GamePuzzleLoading());
      var newGameboard = await _gameboardInteractor.fetchFixPuzzle();
      emit.call(GameInitialWithFixPuzzle(newGameboard.initPuzzle));
    });

    on<GameGetUserUidEvent>((event, emit) async {
      if (event.uid == null) {
        emit.call(GameLoadedUser(null, true));
        return;
      }
      var user = await _gameUserInteractor.findUserByUid(event.uid!);
      if (user != null) {
        emit.call(GameLoadedUser(user, false));
      } else {
        emit.call(GameLoadedUser(null, true));
      }
    });

    on<GameActionEvent>((event, emit) {
      emit.call(GameUpdate(event.errorCode));
    });
  }
}
