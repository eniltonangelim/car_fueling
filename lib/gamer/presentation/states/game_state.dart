part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState._({
    required this.board,
  });

  final Board board;

  factory GameState.initial() => GameState._(board: Board.pure());

  GameState copyWith({
    Board? board,
  }) =>
      GameState._(
        board: board ?? this.board,
      );

  @override
  List<Object> get props => [board];
}
