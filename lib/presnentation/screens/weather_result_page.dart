import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_application_task/presnentation/componants/custom_button.dart';
import 'package:weather_application_task/presnentation/componants/custom_text.dart';
import '../../core/utils/constants.dart';
import '../bloc/weather_cubit.dart';
import '../bloc/weather_state.dart';

class WeatherResultPage extends StatelessWidget {
  const WeatherResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              text: state is WeatherLoaded
                  ? state.result.name
                  : 'Weather Result',
              fontSize: 24,
            ),
            backgroundColor: AppColors.backgroundColor,
          ),
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildBody(context, state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, WeatherState state) {
    if (state is WeatherEmpty) {
      return const Center(
          child: CustomText(text: 'Please enter a city name', fontSize: 16));
    } else if (state is WeatherLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is WeatherLoaded) {
      return _buildWeatherInfo(context, state);
    } else if (state is WeatherError) {
      return Center(child: Text(state.message));
    }
    return const SizedBox.shrink();
  }

  Widget _buildWeatherInfo(BuildContext context, WeatherLoaded state) {
    return Center(
      // Center the content
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            child: CircleAvatar(
              //add color to the background
              backgroundColor: AppColors.circleColor.withOpacity(0.1),
              backgroundImage: NetworkImage(
                Urls.weatherIconUrl(state.result.icon),
              ),
            ),
          ),
          const SizedBox(height: 8), // Add spacing
          CustomText(
            text: '${(state.result.temp - 273.15).toStringAsFixed(0)}°',
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
           SizedBox(height: 16.h), // Add spacing
          CustomText(
            text: state.result.description,
            fontSize: 24,
          ),
          //add date from library
          CustomText(
            text: DateFormat('EEEE, d MMMM').format(DateTime.now()),
            fontSize: 16.sp,
          ),
          const SizedBox(height: 100), // Add spacing
          CustomButton(
            text: 'Search Again',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
