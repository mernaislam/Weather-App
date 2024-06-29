import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  void onSubmitted(String value) {
    var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    getWeatherCubit.getWeather(cityName: value);
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text(
          'Search a City',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
