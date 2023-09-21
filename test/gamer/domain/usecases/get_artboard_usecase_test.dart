

import 'package:car_fueling/core/core.dart';
import 'package:car_fueling/gamer/domain/usecases/get_artboard_usecase.dart';
import 'package:car_fueling/gamer/gamer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_artboard_usecase_test.mocks.dart';

@GenerateMocks([
  GetArtBoardUseCase,
  Board,
])
void main() {

  late GetArtBoardUseCase useCase;
  late Board tBoard;

  setUp(() {
    useCase = MockGetArtBoardUseCase();
    tBoard = MockBoard();

  });

  test('should be UseCase instance', () async {
    // arrange
     when(useCase(NoParams())).thenAnswer((_) async => Right(tBoard));
    // actual
    final actual = await useCase(NoParams());
    // assert
    expect(actual, Right(tBoard));
    verify(useCase.call(NoParams()));
  });


}