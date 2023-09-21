import 'package:module_gamer/module_gamer.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetArtBoardUseCase extends UseCase<Board, GetArtBoardUseCaseParam> {
   GetArtBoardUseCase(BoardRepository repository)
      : _repository = repository;

  final BoardRepository _repository;

  @override
  Future<Either<Failure, Board>> call(GetArtBoardUseCaseParam params) {
    return _repository.buildBoard(params.type);
  }
}

class GetArtBoardUseCaseParam extends Equatable {
  const GetArtBoardUseCaseParam(this.type);

  final BoardType type;

  @override
  List<Object?> get props => [];
}
