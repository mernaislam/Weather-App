import 'package:flutter/material.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class WeatherBodyBuilder extends StatelessWidget {
  final String cityName;
  const WeatherBodyBuilder({super.key, required this.cityName});
  
  @override
  Widget build(BuildContext context) {
    if (cityName == '') {
      return const NoWeatherBody();
    } else {
      return WeatherInfoBody(
        cityName: cityName,
      );
    }
  }
}
