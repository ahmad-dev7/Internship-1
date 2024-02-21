import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getWeather() async {
  String url = 'https://api.openweathermap.org/data/2.5/weather';
  String lat = '19.0330';
  String lon = '73.0297';
  String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';

  /// Url format :- [url]?lat=[latitude]&lon=[longitude]&appid=[apiKey]

  var res = await http.get(Uri.parse('$url?lat=$lat&lon=$lon&appid=$apiKey'));
  if (res.statusCode == 200) {
    // main.temp
    var data = jsonDecode(res.body);
    return (data['main']['temp'] - 273.5).toStringAsFixed(2);
  } else {
    return res.statusCode.toString();
  }
}
