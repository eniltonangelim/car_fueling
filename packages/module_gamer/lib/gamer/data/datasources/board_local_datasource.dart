import 'package:module_gamer/module_gamer.dart';

// Cache
abstract class BoardLocalDataSource {
  Future<Board> buildBoard(BoardType type);
}
