import 'package:get_it/get_it.dart';
import 'package:weather_application_task/presnentation/bloc/weather_cubit.dart';
import 'data/datasource/remote_data_source.dart';
import 'data/repository/weather_repository_impl.dart';
import 'domain/repository/weather_repository.dart';
import 'domain/usecases/get_weather_by_country.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // Bloc
  locator.registerFactory(() => WeatherCubit(locator()));
  // Use cases
  locator.registerLazySingleton(() => GetWeatherByCountryName(locator()));
  //repository
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()));
  // Data sources
  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: locator()));
  // External
  locator.registerLazySingleton(() => http.Client());
}
