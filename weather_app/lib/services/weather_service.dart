import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1b013a8f3b874c77941161526242202';

  Future<WeatherModel> getWeathers(String name) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$name&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJSON(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errMessage = e.response?.data['error']['message'] ?? 'Opps there is an error, try again';
      throw Exception(errMessage);
    } catch (e){
      print(e.toString());
      throw Exception('Opps there is an error, try againnnn');
    }
  }
}
