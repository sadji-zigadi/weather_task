import 'package:equatable/equatable.dart';

abstract class WeatherFailure extends Equatable {
  final String Message;

  WeatherFailure(this.Message);

  @override
  List<Object> get props => [Message];
}

class ServerFailure extends WeatherFailure {
  ServerFailure(String Message) : super(Message);
}

class ConnectionFailure extends WeatherFailure {
  ConnectionFailure(String Message) : super(Message);
}