import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherDetails({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 57, 165, 253),
            Color.fromARGB(255, 168, 215, 253),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at: ${weatherModel.time}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/cloudy.png'),
                Text(
                  '${weatherModel.day.currentTemp.ceil()}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'maxTemp: ${weatherModel.day.maxTemp} \nminTemp: ${weatherModel.day.minTemp}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              weatherModel.day.condition,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}