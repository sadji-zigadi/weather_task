import 'package:equatable/equatable.dart';
import 'package:weather_application_task/domain/entities/weather.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WeatherEmpty extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherEntity result;

  WeatherLoaded(this.result);

  @override
  List<Object> get props => [result];
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);

  @override
  List<Object> get props => [message];
}
