part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState._({
    required this.board,
    required this.type,
    required this.tank,
    required this.distance,
    required this.stops,
  });

  final Board board;
  final BoardType type;
  final int tank;
  final int distance;
  final List<int> stops;

  factory GameState.initial() => GameState._(
        board: Board.pure(),
        type: BoardType.idle,
        tank: 400,
        distance: 950,
        stops: const [],
      );

  GameState copyWith({
    Board? board,
    BoardType? type,
    int? tank,
    int? distance,
    List<int>? stops,
  }) =>
      GameState._(
        board: board ?? this.board,
        type: type ?? this.type,
        tank: tank ?? this.tank,
        distance: distance ?? this.distance,
        stops: stops ?? this.stops,
      );

  @override
  List<Object> get props => [board, type, tank, distance, stops];
}
