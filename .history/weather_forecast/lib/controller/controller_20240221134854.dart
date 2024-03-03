import 'package:get/get.dart';
import 'package:weather_forecast/services.dart';

class WeatherController extends GetxController {
  var temperature = getWeather().obs;
}
