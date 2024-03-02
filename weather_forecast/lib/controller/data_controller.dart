import 'package:get/get.dart';
import 'package:weather_forecast/services/services.dart';

late WeatherController controller;

class WeatherController extends GetxController {
  var cityName = ''.obs;
  var temperature = ''.obs;
  var weatherDescription = ''.obs;
  var dateTimeSinceEpoch = ''.obs;
  var sunriseTimeSinceEpoch = ''.obs;
  var sunsetTimeSinceEpoch = ''.obs;
  var windSpeed = ''.obs;
  var humidity = ''.obs;
  var pressure = ''.obs;
  var cloud = ''.obs;
  var iconCode = ''.obs;
  var countryCode = ''.obs;
  var receivedData = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTemperature();
  }

  getTemperature() async {
    try {
      var data = await WeatherServices().fetchWeather();
      cityName.value = data.cityName;
      temperature.value = (data.temperature - 273).toStringAsFixed(0);
      weatherDescription.value = data.weatherDescription;
      dateTimeSinceEpoch.value = data.dateTimeSinceEpoch.toString();
      sunriseTimeSinceEpoch.value = data.sunriseTimeSinceEpoch.toString();
      sunsetTimeSinceEpoch.value = data.sunsetTimeSinceEpoch.toString();
      windSpeed.value = data.windSpeed.toString();
      humidity.value = data.humidity.toString();
      pressure.value = data.pressure.toString();
      cloud.value = data.cloud.toString();
      iconCode.value = data.iconCode;
      countryCode.value = data.countryCode;
      receivedData.value = true;
      receivedData.refresh();
    } catch (e) {
      Get.snackbar('Failed attempt', 'Failed to fetch weather data');
    }
  }
}
