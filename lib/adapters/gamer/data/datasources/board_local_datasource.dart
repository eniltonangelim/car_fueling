import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_gamer/module_gamer.dart';
import 'package:rive/rive.dart';

class BoardLocalDataSourceImpl implements BoardLocalDataSource {
  BoardLocalDataSourceImpl();

  @override
  Future<Board> buildBoard(BoardType type) async {
    return Board.from(await _execute(type));
  }

  Future<Rive> _execute(BoardType type) async {
    final data = await rootBundle.load('assets/carfueling.riv');
    final fileAsset = RiveFile.import(data);
    Artboard? artBoard = Artboard();

    if (type.isStage2()) {
      artBoard = fileAsset.artboardByName("Refill");
      final stateMachineController =
          StateMachineController.fromArtboard(artBoard!, "Refill State");

      if (stateMachineController != null) {
        artBoard.addController(stateMachineController);
      }
    } else {
      artBoard = fileAsset.artboardByName("Travel");
      final stateMachineController =
          StateMachineController.fromArtboard(artBoard!, "Travel State");

      if (stateMachineController != null) {
        artBoard.addController(stateMachineController);
      }
    }
    return Rive(artboard: artBoard, alignment: Alignment.bottomCenter,);
  }
}
