import 'package:get/get.dart';
import 'package:weather_forecast/services.dart';

class WeatherController extends GetxController {
  var temperature = ''.obs;

  @override
  void onInit() {
    temperature.value = getWeather() as String;
    super.onInit();
  }
}
