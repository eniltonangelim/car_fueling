import 'package:module_gamer/module_gamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final TextEditingController _tankController;
  late final TextEditingController _distanceController;
  late final TextEditingController _stopsController;
  late final TextEditingController _minRefillController;
  String? _message;

  @override
  void initState() {
    super.initState();
    _tankController = TextEditingController();
    _distanceController = TextEditingController();
    _stopsController = TextEditingController();
    _minRefillController = TextEditingController();
    context.read<GameBloc>()
      ..add(const LoadGameEvent(BoardType.idle))
      ..add(UpdateStopsGameEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        String? message;
        if (state.status.isSuccess()) {
          message = "Você acertou!";
        }

        if (state.status.isFailure()) {
          message = "Você errou!";
        }

        if (state.status.isError()) {
          message = "Muito distante!";
        }

        if (state.status.isInitial()) {
          message = "";
          context.read<GameBloc>().add(const LoadGameEvent(BoardType.stage1));
        } else {
          context.read<GameBloc>().add(const LoadGameEvent(BoardType.stage2));
        }

        setState(() {
          _message = message;
        });
      },
      child: buildUI(),
    );
  }

  BlocBuilder<GameBloc, GameState> buildUI() {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        _tankController.text = state.tank.toString();
        _distanceController.text = state.distance.toString();
        _stopsController.text = state.stops.toString().replaceAll("[]", "");
        _minRefillController.text = state.answer.toString();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Car Fueling"),
            backgroundColor: const Color(0xFFD78D68),
            actions: [
              _minRefillController.value.text.isNotEmpty
                  ? IconButton(
                      onPressed: _onRefresh,
                      icon: const Icon(Icons.restart_alt_rounded))
                  : const SizedBox(),
            ],
          ),
          body: SizedBox.expand(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFFD78D68),
                ),
                child: Stack(
                  children: [
                    const ArtBoardWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        InputFieldWidget(
                          size: double.maxFinite,
                          hintText: "Tank:",
                          controller: _tankController,
                          onEditingComplete: (tank) {
                            context.read<GameBloc>()
                              ..add(TankChangeGameEvent(int.parse(tank)))
                              ..add(UpdateStopsGameEvent());
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InputFieldWidget(
                          size: double.maxFinite,
                          hintText: "Dist (km): ",
                          controller: _distanceController,
                          onEditingComplete: (distance) {
                            context.read<GameBloc>()
                              ..add(DistanceChangeGameEvent(int.parse(distance)))
                              ..add(UpdateStopsGameEvent());
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InputFieldWidget(
                          size: double.maxFinite,
                          hintText: "Stops: ",
                          isReadOnly: true,
                          controller: _stopsController,
                          onEditingComplete: (stops) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InputFieldWidget(
                          size: double.maxFinite,
                          hintText: "Min refill: ",
                          controller: _minRefillController,
                          onEditingComplete: (minRefill) {
                            context.read<GameBloc>().add(
                                AnswerMinRefillChangeGameEvent(
                                    int.parse(minRefill)));
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        _message != null
                            ? RichText(
                                text: TextSpan(
                                text: _message,
                                style: DefaultTextStyle.of(context).style,
                              ))
                            : const SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() async {
    context.read<GameBloc>()
      .add(const RefreshGameEvent());
  }
}
