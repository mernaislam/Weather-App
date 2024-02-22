import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1b013a8f3b874c77941161526242202';

  Future<WeatherModel> getWeathers(String name) async {
    final response = await dio.get(
      '$baseUrl/forecast.json?key=$apiKey&q=$name&days=1',
    );
    WeatherModel weatherModel = WeatherModel.fromJSON(response.data);
    return weatherModel;
  }
}
