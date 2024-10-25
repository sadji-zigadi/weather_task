import 'package:bloc/bloc.dart';
import 'package:weather_application_task/presnentation/bloc/weather_state.dart';
import '../../domain/usecases/get_weather_by_country.dart';


class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherByCountryName _getWeatherByCountryName;

  WeatherCubit(this._getWeatherByCountryName) : super(WeatherEmpty());
  void onCityNameChanged(String cityName) async {
    emit(WeatherLoading());
    final result = await _getWeatherByCountryName.excute(cityName);
    result.fold(
          (failure) {
        emit(WeatherError(failure.message));
      },
          (data) {
        emit(WeatherLoaded(data));
      },
    );
  }
}
