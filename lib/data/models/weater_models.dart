import '../../domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required String name,
    required double temp,
    required String description,
    required String icon,
    required int statusCode,
  }) : super(
          name: name,
          temp: temp,
          description: description,
          icon: icon,
          statusCode: statusCode,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      temp: json['main']['temp'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      statusCode: json['cod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'temp': temp,
      'description': description,
      'icon': icon,
      'statusCode': statusCode,
    };
  }
  WeatherEntity toEntity(){
    return WeatherEntity(
      name: name,
      temp: temp,
      description: description,
      icon: icon,
      statusCode: statusCode,
    );
  }
}