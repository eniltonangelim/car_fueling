
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Board extends Equatable {
  const Board._(this.art);

  final Widget art;

  factory Board.from(Widget art) => Board._(art);

  factory Board.pure() => const Board._(Placeholder());

  @override
  List<Object> get props => [art];
}