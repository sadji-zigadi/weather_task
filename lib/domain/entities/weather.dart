import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String name;
  final double temp;
  final String description;
  final String icon;
  final int statusCode;

  WeatherEntity({
    required this.name,
    required this.temp,
    required this.description,
    required this.icon,
    required this.statusCode,
  });

  @override
  List<Object> get props => [name, temp, description, icon, statusCode];
}
