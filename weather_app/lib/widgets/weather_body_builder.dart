import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_details.dart';

class WeatherBodyBuilder extends StatelessWidget {
  final String cityName;
  const WeatherBodyBuilder({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return WeatherDetails();
        }
        if (state is WeatherFailedState) {
          return const Center(
            child: Text(
              textAlign: TextAlign.center,
              'Something went wrong, \nPlease check city name written correctly',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        } 
        return const NoWeatherBody();
      },
    );
  }
}
