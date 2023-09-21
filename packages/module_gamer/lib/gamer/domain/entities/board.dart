import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum BoardType {
  idle,
  stage1,
  stage2,
}

extension BoardTypeX on BoardType {
  bool isIdle() => this == BoardType.idle;

  bool isStage1() => this == BoardType.stage1;

  bool isStage2() => this == BoardType.stage2;
}

class Board extends Equatable {
  const Board._(this.art);

  final Widget art;

  factory Board.from(Widget art) => Board._(art);

  factory Board.pure() => const Board._(Placeholder());

  @override
  List<Object> get props => [art];
}
