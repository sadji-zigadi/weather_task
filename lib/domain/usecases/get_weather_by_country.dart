import 'package:dartz/dartz.dart';
import 'package:weather_application_task/core/error/failure.dart';

import '../entities/weather.dart';
import '../repository/weather_repository.dart';

class GetWeatherByCountryName {
  final WeatherRepository repository;

  GetWeatherByCountryName(
    this.repository,
  );
  Future<Either<WeatherFailure,WeatherEntity>> excute(String cityName) async{
    return await repository.getWeatherByCountry(cityName);
  }
}
