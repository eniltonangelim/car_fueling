import 'package:module_gamer/module_gamer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'compute_min_refill_usecase.mocks.dart';

@GenerateMocks([
  RefillRepository,
])
void main() {
  late RefillRepository tRepository;
  late ComputeMinRefillUseCase tUseCase;
  late ComputeMinRefillParams tParams950Miles;
  late ComputeMinRefillParams tParams10Miles;
  late ComputeMinRefillParams tParams3Miles;

  setUp(() {
    tRepository = MockRefillRepository();
    tUseCase = ComputeMinRefillUseCase(tRepository);
    tParams950Miles = const ComputeMinRefillParams(
      400,
      950,
      [200, 375, 550, 750],
    );
    tParams10Miles = const ComputeMinRefillParams(
      3,
      10,
      [1, 2, 3, 9],
    );
    tParams3Miles = const ComputeMinRefillParams(
      250,
      100,
      [100, 150],
    );
  });

  test(
      'should be [2] the minimum refill '
      'to [200, 375, 550, 750]', () async {
    // arrange
    when(tUseCase(tParams950Miles)).thenAnswer((_) async => const Right(2));
    // actual
    final actual = await tUseCase(tParams950Miles);
    // assert
    expect(actual, const Right(2));
    verify(tUseCase.call(tParams950Miles)).called(1);
    verifyNoMoreInteractions(tRepository);
  });

  test(
      'should be [Failure] the minimum refill '
      'to [1, 2, 5, 9]', () async {
    // arrange
    when(tUseCase(tParams10Miles))
        .thenAnswer((_) async => Left(RefillFailure()));
    // actual
    final actual = await tUseCase(tParams10Miles);
    // assert
    expect(actual, Left(RefillFailure()));
    verify(tUseCase(tParams10Miles)).called(1);
    verifyNoMoreInteractions(tRepository);
  });

  test(
      'should be [0] the minimum refill '
      'to [100, 150]', () {
    // arrange
    // actual
    // assert
  });
}
