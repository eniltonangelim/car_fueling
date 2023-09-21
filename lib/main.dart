import 'package:car_fueling/adapters/adapters.dart';
import 'package:car_fueling/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_gamer/module_gamer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Fueling',
      theme: themeData,
      home: BlocProvider(
        create: (_) => GameBloc(
          artBoardUseCase: GetArtBoardUseCase(
              BoardRepositoryImpl(BoardLocalDataSourceImpl())),
        ),
        child: const GamePage(),
      ),
    );
  }
}
