import 'package:bloc_test/bloc_test.dart';
import 'package:car_fueling/gamer/gamer.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late GameBloc bloc;

  setUp(() {
    bloc = GameBloc();
  });

  test('Initial state should be initial',
      () => expect(bloc.state, GameState.initial()));

  blocTest<GameBloc, GameState>(
    'should emits [loading, loaded] '
    'when init page [gamepad]',
    build: () => GameBloc(),
    act: (bloc) {
      // TODO: implement
    },
    expect: () => <GameState>[
      // TODO: implement
    ],
  );
}
