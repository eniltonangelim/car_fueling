import 'package:module_gamer/module_gamer.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ComputeMinRefillUseCase extends UseCase<int, ComputeMinRefillParams> {
  ComputeMinRefillUseCase(RefillRepository repository)
      : _repository = repository;

  final RefillRepository _repository;

  @override
  Future<Either<Failure, int>> call(ComputeMinRefillParams params) {
    return _repository.computeMinRefill(
      params.tank,
      params.distance,
      params.stops,
    );
  }
}

class ComputeMinRefillParams extends Equatable {
  const ComputeMinRefillParams(this.tank, this.distance, this.stops);

  final int tank;
  final int distance;
  final List<int> stops;

  @override
  List<Object?> get props => [tank, distance, stops];
}
