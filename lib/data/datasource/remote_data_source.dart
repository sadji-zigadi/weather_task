import 'dart:convert';
import 'package:weather_application_task/core/utils/constants.dart';
import 'package:weather_application_task/data/models/weater_models.dart';
import 'package:http/http.dart' as http;
import '../../core/error/exceptions.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherUrl(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
