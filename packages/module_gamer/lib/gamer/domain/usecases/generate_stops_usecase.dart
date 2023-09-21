import 'package:equatable/equatable.dart';
import 'package:module_gamer/module_gamer.dart';
import 'package:dartz/dartz.dart';

class GenerateStopsUseCase
    extends UseCase<List<int>, GenerateStopsUseCaseParam> {
  GenerateStopsUseCase(this.repository);

  final RefillRepository repository;

  @override
  Future<Either<Failure, List<int>>> call(GenerateStopsUseCaseParam params) {
    return repository.genStops(params.distance);
  }
}

class GenerateStopsUseCaseParam extends Equatable {
  const GenerateStopsUseCaseParam(this.distance);

  final int distance;

  @override
  List<Object> get props => [distance];
}
