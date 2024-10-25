import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_application_task/core/utils/constants.dart';
import 'package:weather_application_task/presnentation/componants/custom_button.dart';
import 'package:weather_application_task/presnentation/componants/custom_text.dart';
import 'package:weather_application_task/presnentation/componants/custom_text_field.dart';
import 'package:weather_application_task/presnentation/screens/weather_result_page.dart';
import '../bloc/weather_cubit.dart';

class WeatherSearchPage extends StatelessWidget {
  WeatherSearchPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: CustomText(
              text: 'Weather Search',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: AppColors.backgroundColor,
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/seasons.png',
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.width,
                      ),
                       SizedBox(height: 16.h),
                      CustomTextField(
                          controller: _controller,
                          hintText: 'Enetr a City Name'),
                       SizedBox(height: 16.0.h),
                      CustomButton(
                        text: 'Search',
                        onPressed: () {
                          context
                              .read<WeatherCubit>()
                              .onCityNameChanged(_controller.text);
                          _controller.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WeatherResultPage();
                              },
                            ),
                          );
                        },
                      ),
                       SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
