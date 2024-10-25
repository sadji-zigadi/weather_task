import 'package:dartz/dartz.dart';
import 'package:weather_application_task/domain/entities/weather.dart';

import '../../core/error/failure.dart';

abstract class WeatherRepository {
  Future<Either<WeatherFailure, WeatherEntity>> getWeatherByCountry(
      String name);
}
