import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:weather_application_task/core/error/failure.dart';
import '../../core/error/exceptions.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repository/weather_repository.dart';
import '../datasource/remote_data_source.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({
    required this.weatherRemoteDataSource,
  });

  @override
  Future<Either<WeatherFailure, WeatherEntity>> getWeatherByCountry(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
