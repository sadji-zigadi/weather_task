import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const String weatherUrl = 'https://api.openweathermap.org/data/2.5';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String currentWeatherUrl(String cityName) =>
      '$weatherUrl/weather?q=$cityName&appid=$apiKey';
  static String weatherIconUrl(String icon) =>
      'http://openweathermap.org/img/wn/$icon@2x.png';
}
