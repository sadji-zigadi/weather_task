import 'package:equatable/equatable.dart';

abstract class WeatherFailure extends Equatable {
  final String message;

  const WeatherFailure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends WeatherFailure {
  const ServerFailure(super.message);
}

class ConnectionFailure extends WeatherFailure {
  const ConnectionFailure(super.message);
}