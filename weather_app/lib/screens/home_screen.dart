import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/weather_body_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = '';

  Future<void> getCityNameInput(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const SearchScreen(),
      ),
    );

    if (!context.mounted) return;
    
    setState(() {
      cityName = result;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              getCityNameInput(context);
            },
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: WeatherBodyBuilder(
        cityName: cityName,
      ),
    );
  }
}
