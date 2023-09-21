import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);

  final List properties;

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {
  ServerFailure({String? message}) : super([message]);
}

class CacheFailure extends Failure {
  CacheFailure({String? message}) : super([message]);
}

class NetworkFailure extends Failure {
  NetworkFailure({String? message}) : super([message]);
}
