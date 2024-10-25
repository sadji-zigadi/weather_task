import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_task/presnentation/bloc/weather_cubit.dart';
import '../../core/utils/constants.dart';
import '../bloc/weather_state.dart';

class WeatherResultPage extends StatelessWidget {
  const WeatherResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherEmpty) {
              return const Text('Please enter a city name');
            } else if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            } else if (state is WeatherLoaded) {
              return Column(
                children: [
                  Text(state.result.name),
                  Text(state.result.temp.toString()),
                  Text(state.result.description),
                  Image(
                      image:
                          NetworkImage(Urls.weatherIconUrl(state.result.icon))),
                ],
              );
            } else if (state is WeatherError) {
              return Text(state.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
