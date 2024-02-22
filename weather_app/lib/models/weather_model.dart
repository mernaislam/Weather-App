import 'package:intl/intl.dart';
import 'package:weather_app/models/day_model.dart';

class WeatherModel {
  final String cityName;
  final String time;
  final DayModel day;

  const WeatherModel({
    required this.day,
    required this.cityName,
    required this.time,
  });

  factory WeatherModel.fromJSON(json) {
    String cityName = json['location']['name'];

    DateTime dateTimeWithTimeZone =
        DateTime.parse(json['location']['localtime']);
    String formattedTime = DateFormat.jm().format(dateTimeWithTimeZone);

    double currentTemp = json['current']['temp_c'];
    double minTemp = json['forecast']['forecastday'][0]['day']['mintemp_c'];
    double maxTemp = json['forecast']['forecastday'][0]['day']['maxtemp_c'];
    String condition =
        json['forecast']['forecastday'][0]['day']['condition']['text'];

    return WeatherModel(
      cityName: cityName,
      time: formattedTime,
      day: DayModel(
        currentTemp: currentTemp,
        minTemp: minTemp,
        maxTemp: maxTemp,
        condition: condition,
      ),
    );
  }
}
