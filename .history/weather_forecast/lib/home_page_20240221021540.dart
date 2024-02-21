import 'package:flutter/material.dart';
import 'package:weather_forecast/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String> temp;
  @override
  void initState() {
    temp = getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: Center(
        child: Visibility(
          visible: temp == '0',
          replacement: const CircularProgressIndicator(),
          child: const Text(
            'Temperature',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
