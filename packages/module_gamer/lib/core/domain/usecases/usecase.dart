import 'package:dartz/dartz.dart';
import 'package:module_gamer/module_gamer.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

