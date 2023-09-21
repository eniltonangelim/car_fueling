import 'package:module_gamer/module_gamer.dart';
import 'package:dartz/dartz.dart';

abstract class RefillRepository {
  Future<Either<Failure, int>> computeMinRefill(
      int tank, int distance, List<int> stops);

  Future<Either<Failure, List<int>>> genStops(int distance);
}
