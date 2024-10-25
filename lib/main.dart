import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_application_task/presnentation/bloc/weather_cubit.dart';
import 'package:weather_application_task/presnentation/screens/weather_search_page.dart';
import 'injection_container.dart';

Future<void> main() async {
  setupLocator();
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => locator<WeatherCubit>(),
        child: MaterialApp(
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
              child: widget!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Weather Application',
          home: WeatherSearchPage(),
        ),
      ),
    );
  }
}
