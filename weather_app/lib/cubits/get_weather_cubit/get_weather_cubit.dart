import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit():super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName})async{
    try {
      weatherModel = await WeatherService().getWeathers(cityName);
      emit(WeatherLoadedState());
    } on Exception catch (e) {
      print(e.toString());
      emit(WeatherFailedState());
    }
  }
}