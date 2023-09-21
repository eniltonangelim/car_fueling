// Cache
abstract class RefillLocalDataSource {
  Future<int> computeMinRefill(
    int tank,
    int distance,
    List<int> stops,
  );

  Future<List<int>> genStops(int distance);
}
