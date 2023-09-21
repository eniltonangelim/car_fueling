import 'package:bloc/bloc.dart';
import 'package:car_fueling/gamer/gamer.dart';
import 'package:equatable/equatable.dart';
import 'package:rive/rive.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
