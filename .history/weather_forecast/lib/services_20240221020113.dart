import 'package:http/http.dart' as http;

getWeather() async {
  String url = 'https://api.openweathermap.org/data/2.5/weather';
  String lat = '19.0330';
  String lon = '73.0297';
  String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';

  /// Url format :- [url]?lat=[latitude]&lon=[longitude]&appid=[apiKey]

  var res = await http.get(Uri.parse('$url?lat=$lat&lon=$lon&appid=$apiKey'));
  if (res.statusCode == 200) {
    print(res.statusCode);
    print(res.body);
  } else {
    print(res.statusCode);
  }
}
