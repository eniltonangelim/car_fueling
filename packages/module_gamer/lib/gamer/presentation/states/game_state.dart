part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState._({
    required this.board,
    required this.type,
    required this.tank,
    required this.distance,
    required this.stops,
    required this.answer,
    required this.status,
  });

  final Board board;
  final StateStatus status;
  final BoardType type;
  final int tank;
  final int distance;
  final int answer;
  final List<int> stops;

  factory GameState.initial() => GameState._(
        board: Board.pure(),
        type: BoardType.idle,
        tank: 400,
        distance: 950,
        stops: const [],
        answer: 0,
        status: StateStatus.initial,
      );

  GameState copyWith({
    Board? board,
    BoardType? type,
    int? tank,
    int? distance,
    List<int>? stops,
    int? answer,
    StateStatus? status,
  }) =>
      GameState._(
        board: board ?? this.board,
        type: type ?? this.type,
        tank: tank ?? this.tank,
        distance: distance ?? this.distance,
        stops: stops ?? this.stops,
        answer: answer ?? this.answer,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [board, type, tank, distance, stops, status];
}
