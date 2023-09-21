import 'package:dartz/dartz.dart';
import 'package:module_gamer/module_gamer.dart';

class RefillRepositoryImpl implements RefillRepository {
  RefillRepositoryImpl(RefillLocalDataSource cacheDataSource)
      : _cacheDataSource = cacheDataSource;

  final RefillLocalDataSource _cacheDataSource;

  @override
  Future<Either<Failure, int>> computeMinRefill(
      int tank, int distance, List<int> stops) async {
    try {
      return Right(
          await _cacheDataSource.computeMinRefill(tank, distance, stops));
    } on RefillException {
      return Left(RefillFailure());
    }
  }

  @override
  Future<Either<Failure, List<int>>> genStops(int distance) async {
    try {
      return Right(await _cacheDataSource.genStops(distance));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
