import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:module_gamer/gamer/domain/usecases/generate_stops_usecase.dart';
import 'package:module_gamer/module_gamer.dart';

part 'game_event.dart';
part 'game_state.dart';

enum StateStatus {
  initial,
  failure,
  success,
  error,
}

extension StateStatusX on StateStatus {
  bool isInitial() => this == StateStatus.initial;

  bool isSuccess() => this == StateStatus.success;

  bool isFailure() => this == StateStatus.failure;

  bool isError() => this == StateStatus.error;
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required GetArtBoardUseCase artBoardUseCase,
    required GenerateStopsUseCase stopsUseCase,
    required ComputeMinRefillUseCase computeMinRefillUseCase,
  })  : _artBoardUseCase = artBoardUseCase,
        _stopsUseCase = stopsUseCase,
        _computeMinRefillUseCase = computeMinRefillUseCase,
        super(GameState.initial()) {
    on<LoadGameEvent>(onLoadGame);
    on<TankChangeGameEvent>(onTankChange);
    on<DistanceChangeGameEvent>(onDistanceChange);
    on<UpdateStopsGameEvent>(onUpdateStops);
    on<AnswerMinRefillChangeGameEvent>(onAnswerMinRefillChange);
    on<StartGameEvent>(onStartGame);
    on<RefreshGameEvent>(onRefresh);
  }

  final GetArtBoardUseCase _artBoardUseCase;
  final GenerateStopsUseCase _stopsUseCase;
  final ComputeMinRefillUseCase _computeMinRefillUseCase;

  void onLoadGame(LoadGameEvent event, Emitter<GameState> emit) async {
    final eitherBoard =
        await _artBoardUseCase(GetArtBoardUseCaseParam(event.type));

    eitherBoard.fold((l) => emit(state), (r) => emit(state.copyWith(board: r)));
  }

  void onStartGame(StartGameEvent event, Emitter<GameState> emit) async {
    final eitherBoard =
        await _artBoardUseCase(const GetArtBoardUseCaseParam(BoardType.stage2));

    eitherBoard.fold((l) => emit(state), (r) => emit(state.copyWith(board: r)));
  }

  void onUpdateStops(
      UpdateStopsGameEvent event, Emitter<GameState> emit) async {
    final eitherStops =
        await _stopsUseCase(GenerateStopsUseCaseParam(state.distance));

    eitherStops.fold((l) => emit(state), (r) => emit(state.copyWith(stops: r)));
  }

  void onTankChange(TankChangeGameEvent event, Emitter<GameState> emit) {
    emit(state.copyWith(tank: event.tank));
  }

  void onDistanceChange(
      DistanceChangeGameEvent event, Emitter<GameState> emit) {
    emit(state.copyWith(distance: event.distance));
  }

  void onAnswerMinRefillChange(
    AnswerMinRefillChangeGameEvent event,
    Emitter<GameState> emit,
  ) async {
    final eitherCompute = await _computeMinRefillUseCase(
        ComputeMinRefillParams(state.tank, state.distance, state.stops));

    eitherCompute.fold(
      (l) => emit(state.copyWith(status: StateStatus.error)),
      (r) {
        if (r == event.minRefill) {
          emit(state.copyWith(status: StateStatus.success));
        } else {
          emit(state.copyWith(status: StateStatus.failure));
        }
      },
    );
  }

  void onRefresh(RefreshGameEvent event, Emitter<GameState> emit) {
    emit(GameState.initial());
  }

}
