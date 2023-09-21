
import 'package:module_gamer/module_gamer.dart';
import 'package:dartz/dartz.dart';

abstract class BoardRepository {
  Future<Either<Failure, Board>> buildBoard(BoardType type);
}