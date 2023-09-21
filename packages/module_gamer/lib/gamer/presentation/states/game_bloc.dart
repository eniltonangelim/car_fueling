import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:module_gamer/module_gamer.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required GetArtBoardUseCase artBoardUseCase})
      : _artBoardUseCase = artBoardUseCase,
        super(GameState.initial()) {
    on<LoadGameEvent>(onLoadGame);
  }

  final GetArtBoardUseCase _artBoardUseCase;

  void onLoadGame(LoadGameEvent event, Emitter<GameState> emit) async {
    final eitherBoard =
        await _artBoardUseCase(GetArtBoardUseCaseParam(event.type));

    eitherBoard.fold((l) => emit(state), (r) => emit(state.copyWith(board: r)));
  }

  void onTankChange(TankChangeGameEvent event, Emitter<GameState> emit) {
    emit(state.copyWith(tank: event.tank));
  }

  void onDistanceChange(
      DistanceChangeGameEvent event, Emitter<GameState> emit) {
    emit(state.copyWith(tank: event.distance));
  }
}
