import 'package:module_gamer/module_gamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should be an Board instance", () {
    // arrange
    // actual
    final Board actual = Board.pure();
    // assert
    expect(actual, isInstanceOf<Board>());
    expect(actual.art, isInstanceOf<Placeholder>());
  });
}
