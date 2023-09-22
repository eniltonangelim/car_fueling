import 'dart:math';

import 'package:module_gamer/module_gamer.dart';

class RefillLocalDataSourceImpl implements RefillLocalDataSource {
  @override
  Future<int> computeMinRefill(int tank, int distance, List<int> stops) async {
    if (tank > distance) {
      return 0;
    }

    if (stops[0] < 0) {
      throw RefillException();
    }

    if (stops.last > distance) {
      throw RefillException();
    }

    if (stops.last - (stops.last - 1) > tank) {
      throw RefillException();
    }

    if ((distance - stops.last) > tank) {
      throw RefillException();
    }

    return distance ~/ tank;
  }

  @override
  Future<List<int>> genStops(int distance) async {
    List<int> stops = [];
    for (var i = 0; i < 4; i++) {
      stops.add(Random().nextInt(distance));
    }
    stops.sort();
    return stops;
  }

}