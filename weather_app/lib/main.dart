import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.day
                      .condition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light rain with thunder':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Light snow showers':
    case 'Light snow with thunder':
      return Colors.lightBlue;
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Moderate or heavy snow':
    case 'Patchy heavy snow':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy snow with thunder':
      return Colors.indigo;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.cyan;
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Moderate or heavy freezing rain':
      return Colors.deepPurple;
    case 'Thundery outbreaks possible':
    case 'Thunder':
      return Colors.purple;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightGreen;
    default:
      return Colors.blue; // Default color
  }
}
