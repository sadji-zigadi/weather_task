import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<WeatherCubit>(),
      child: MaterialApp(
        title: 'Weather Application',
        home: WeatherSearchPage(),
      ),
    );
  }
}
