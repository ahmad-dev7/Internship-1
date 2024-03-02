import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/controller/data_controller.dart';
import 'package:weather_forecast/loader_screen.dart';

void main() {
  controller = Get.put(WeatherController());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',
      home: ShowLoader(),
    );
  }
}
