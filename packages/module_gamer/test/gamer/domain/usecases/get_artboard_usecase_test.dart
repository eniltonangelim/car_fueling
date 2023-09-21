
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_gamer/module_gamer.dart';

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