part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class LoadGameEvent extends GameEvent {
  const LoadGameEvent(this.type);

  final BoardType type;

  @override
  List<Object?> get props => [type];
}

class UpdateStopsGameEvent extends GameEvent {
  @override
  List<Object?> get props => [];
}

class StartGameEvent extends GameEvent {
  @override
  List<Object?> get props => [];
}

class StopGameEvent extends GameEvent {
  @override
  List<Object?> get props => [];
}

class AnswerMinRefillChangeGameEvent extends GameEvent {
  const AnswerMinRefillChangeGameEvent(this.minRefill);

  final int minRefill;

  @override
  List<Object?> get props => [minRefill];
}

class TankChangeGameEvent extends GameEvent {
  const TankChangeGameEvent(this.tank);
  final int tank;

  @override
  List<Object> get props => [tank];
}

class DistanceChangeGameEvent extends GameEvent {
  const DistanceChangeGameEvent(this.distance);
  final int distance;

  @override
  List<Object> get props => [distance];
}

class RefreshGameEvent extends GameEvent {
  const RefreshGameEvent();

  @override
  List<Object?> get props => [];


}