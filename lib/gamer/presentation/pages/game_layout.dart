import 'package:car_fueling/gamer/gamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

@Deprecated("Versão de teste da animação")
class GameLayout extends StatefulWidget {
  const GameLayout({super.key});

  @override
  State<GameLayout> createState() => _GameLayoutState();
}

class _GameLayoutState extends State<GameLayout> {
  /// Controller for playback
  late RiveAnimationController _controller;
  late StateMachineController? _stateMachineController;

  Artboard? _artBoard;
  SMIInput<bool>? _idleInput;
  SMIInput<bool>? _clickedInput;
  SMIInput<bool>? _successInput;
  SMIInput<bool>? _failedInput;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/carfueling.riv').then((data) async {
      final animationFileAsset = RiveFile.import(data);
      final artBoard = animationFileAsset.artboardByName("Travel");
      _stateMachineController =
          StateMachineController.fromArtboard(artBoard!, "Travel State");

      if (_stateMachineController != null) {
        artBoard.addController(_stateMachineController!);
        _idleInput = _stateMachineController!.findInput('isIdle');
        _clickedInput = _stateMachineController!.findInput('Clicked');
        _successInput = _stateMachineController!.findInput('isSuccess');
        _failedInput = _stateMachineController!.findInput('isFailed');
      }

      setState(() => _artBoard = artBoard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Fueling"),
        backgroundColor: Color(0xFFD78D68),
        actions: [
          IconButton(
              onPressed: () => _clickedInput?.value = true,
              icon: const Icon(Icons.play_arrow_rounded)),
          IconButton(
              onPressed: () => _successInput?.value = true,
              icon: const Icon(
                Icons.circle,
                color: Colors.green,
              )),
          IconButton(
              onPressed: () => _failedInput?.value = true,
              icon: const Icon(
                Icons.incomplete_circle_rounded,
                color: Colors.deepOrange,
              ))
        ],
      ),
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFFD78D68),
          ),
          child: Stack(children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InputFieldWidget(size: double.maxFinite, hintText: "Tank: "),
                SizedBox(height: 8,),
                InputFieldWidget(
                    size: double.maxFinite, hintText: "Dist (km): "),
              ],
            ),
            _artBoard == null
                ? const Center(child: CircularProgressIndicator())
                : Rive(
                    artboard: _artBoard!,
                    alignment: Alignment.bottomCenter,
                  ),
          ]),
        ),
      ),
    );
  }
}
