import 'package:equatable/equatable.dart';

abstract class WeatherFailure extends Equatable {
  final String message;

  WeatherFailure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends WeatherFailure {
  ServerFailure(String Message) : super(Message);
}

class ConnectionFailure extends WeatherFailure {
  ConnectionFailure(String Message) : super(Message);
}