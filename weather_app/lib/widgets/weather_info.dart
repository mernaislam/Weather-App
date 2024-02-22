import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/weather_details.dart';

class WeatherInfoBody extends StatelessWidget {
  final String cityName;
  const WeatherInfoBody({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WeatherService().getWeathers(cityName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WeatherDetails(
            weatherModel: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              textAlign: TextAlign.center,
              'Something went wrong, \nPlease check city name written correctly',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
