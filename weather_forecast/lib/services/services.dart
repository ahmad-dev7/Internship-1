import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/model/models.dart';

class WeatherServices {
  Future<WeatherDetails> fetchWeather() async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
    String lat = '19.0330';
    String lon = '73.0297';
    String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';
    var response = await http.get(
      Uri.parse('${baseUrl}lat=$lat&lon=$lon&appid=$apiKey'),
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      WeatherDetails weatherData = WeatherDetails(
        data['name'],
        data['main']['temp'],
        data['weather'][0]['description'],
        data['dt'],
        data['sys']['sunrise'],
        data['sys']['sunset'],
        data['wind']['speed'],
        data['main']['humidity'],
        data['main']['pressure'],
        data['clouds']['all'],
        data['weather'][0]['icon'],
        data['sys']['country'],
      );
      return weatherData;
    } else {
      throw ('Error! Please Check Your Internet Connection');
    }
  }
}
