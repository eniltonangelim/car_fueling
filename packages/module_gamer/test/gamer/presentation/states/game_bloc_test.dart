import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_gamer/gamer/domain/usecases/generate_stops_usecase.dart';
import 'package:module_gamer/module_gamer.dart';

import 'game_bloc_test.mocks.dart';

@GenerateMocks([
  BoardRepository,
  RefillRepository,
])
main() {
  late GameBloc bloc;
  late ComputeMinRefillUseCase computeMinRefillUseCase;
  late GenerateStopsUseCase stopsUseCase;
  late GetArtBoardUseCase getArtBoardUseCase;
  late BoardRepository boardRepository;
  late RefillRepository refillRepository;
  late GetArtBoardUseCaseParam getArtBoardUseCaseParam;
  late Board boardStage2;

  setUp(() {
    boardRepository = MockBoardRepository();
    computeMinRefillUseCase = ComputeMinRefillUseCase(MockRefillRepository());
    stopsUseCase = GenerateStopsUseCase(MockRefillRepository());
    getArtBoardUseCase = GetArtBoardUseCase(boardRepository);
    getArtBoardUseCaseParam = const GetArtBoardUseCaseParam(BoardType.idle);
    boardStage2 = Board.from(const Placeholder());
  });

  // test('Initial state should be initial',
  //     () => expect(bloc.state, GameState.initial()));
  group('GameBloc', () {
    blocTest<GameBloc, GameState>(
      'should emits [loading, loaded] '
      'when init page [gamepad]',
      setUp: (() {
        when(getArtBoardUseCase(getArtBoardUseCaseParam))
            .thenAnswer((_) async => Right(Board.pure()));
      }),
      build: () => GameBloc(
        computeMinRefillUseCase: computeMinRefillUseCase,
        stopsUseCase: stopsUseCase,
        artBoardUseCase: getArtBoardUseCase,
      ),
      act: (bloc) => bloc.add(const LoadGameEvent(BoardType.idle)),
      expect: () => [GameState.initial()],
    );

    blocTest<GameBloc, GameState>(
      'should emits [loaded, start] '
      'when start [game]',
      setUp: (() {
        when(getArtBoardUseCase(getArtBoardUseCaseParam))
            .thenAnswer((_) async => Right(Board.pure()));
        when(getArtBoardUseCase(
                const GetArtBoardUseCaseParam(BoardType.stage2)))
            .thenAnswer((_) async => Right(boardStage2));
      }),
      build: () => GameBloc(
        computeMinRefillUseCase: computeMinRefillUseCase,
        stopsUseCase: stopsUseCase,
        artBoardUseCase: getArtBoardUseCase,
      ),
      act: (bloc) => bloc
        ..add(const LoadGameEvent(BoardType.idle))
        ..add(StartGameEvent()),
      expect: () {
        GameState state = GameState.initial();
        return [state, state.copyWith(board: boardStage2)];
      },
    );
  });
}
