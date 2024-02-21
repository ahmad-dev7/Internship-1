import 'package:flutter/material.dart';
import 'package:weather_forecast/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getWeather();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: const Center(
        child: Text(
          'Temperature',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
