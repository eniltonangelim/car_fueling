import 'package:module_gamer/module_gamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    context.read<GameBloc>().add(const LoadGameEvent(BoardType.idle));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Car Fueling"),
            backgroundColor: const Color(0xFFD78D68),
          ),
          body: SizedBox.expand(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0xFFD78D68),
              ),
              child: Stack(
                children: [
                  ArtBoardWidget(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InputFieldWidget(
                        size: double.maxFinite,
                        hintText: "Tank:",
                        controller: TextEditingController(),
                        onEditingComplete: (tank) {
                          context
                              .read<GameBloc>()
                              .add(TankChangeGameEvent(int.parse(tank)));
                         FocusScope.of(context).unfocus();
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InputFieldWidget(
                        size: double.maxFinite,
                        hintText: "Dist (km): ",
                        controller: TextEditingController(),
                        onEditingComplete: (distance) {
                          context
                              .read<GameBloc>()
                              .add(DistanceChangeGameEvent(int.parse(distance)));
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
