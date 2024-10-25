import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application_task/presnentation/screens/weather_result_page.dart';
import '../bloc/weather_cubit.dart';

class WeatherSearchPage extends StatelessWidget {
   WeatherSearchPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Search'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter city name',
                ),
                textInputAction: TextInputAction.search,
                controller: _controller,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  //add event to bloc
                  context.read<WeatherCubit>().onCityNameChanged(_controller.text);
                  //navigate to result page
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  WeatherResultPage();
                  }));
                },
                child: const Text('Search'),
              ),
              const SizedBox(height: 16.0),
            ],
          )),
    );
  }
}
