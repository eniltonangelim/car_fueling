import 'package:module_gamer/module_gamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtBoardWidget extends StatelessWidget {
  const ArtBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (previous, current) => previous.board != current.board,
      builder: (context, state) => state.board.art,
    );
  }
}
