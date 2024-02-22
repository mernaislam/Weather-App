import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There is no weather, \nStart searching now 🔍',
        style: TextStyle(
          fontSize: 27,
        ),
      ),
    );
  }
}
