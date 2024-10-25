import 'dart:ui';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const String weatherUrl = 'https://api.openweathermap.org/data/2.5';

  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static String currentWeatherUrl(String cityName) =>
      '$weatherUrl/weather?q=$cityName&appid=$apiKey';

  static String weatherIconUrl(String icon) =>
      'http://openweathermap.org/img/wn/$icon@2x.png';
}

class AppColors {
  static const Color primaryColor = Color(0xFFEC6E4C);
  static const Color darkColor = Color(0xFF48484A);
  static const Color lightColor = Color(0xFFF2F2F1);
  static const Color backgroundColor = Color(0xFFF9F5F3);
  static const Color circleColor = Color(0xFF48484A);
}
