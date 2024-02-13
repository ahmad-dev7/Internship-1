import 'package:flutter/material.dart';
import 'package:weather_forecast/home_page.dart';

void main() => runApp(const MyApp());
String url = 'https://api.openweathermap.org/data/2.5/weather?';
String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',
      home: HomePage(),
    );
  }
}
