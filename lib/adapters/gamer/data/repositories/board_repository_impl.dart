import 'package:dartz/dartz.dart';
import 'package:module_gamer/module_gamer.dart';

class BoardRepositoryImpl implements BoardRepository {
  BoardRepositoryImpl(BoardLocalDataSource cacheDataSource)
      : _cacheDataSource = cacheDataSource;

  final BoardLocalDataSource _cacheDataSource;

  @override
  Future<Either<Failure, Board>> buildBoard(BoardType type) async {
    try {
      return Right(await _cacheDataSource.buildBoard(type));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
