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
    setState(() {
      temp = getWeather();
    });
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
          visible: temp != null,
          replacement: const CircularProgressIndicator(),
          child: Text(
            temp.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
