class WeatherDetails {
  dynamic cityName;
  dynamic temperature;
  dynamic weatherDescription;
  dynamic dateTimeSinceEpoch;
  dynamic sunriseTimeSinceEpoch;
  dynamic sunsetTimeSinceEpoch;
  dynamic windSpeed;
  dynamic humidity;
  dynamic pressure;
  dynamic cloud;
  dynamic iconCode;
  dynamic countryCode;

  WeatherDetails(
    this.cityName,
    this.temperature,
    this.weatherDescription,
    this.dateTimeSinceEpoch,
    this.sunriseTimeSinceEpoch,
    this.sunsetTimeSinceEpoch,
    this.windSpeed,
    this.humidity,
    this.pressure,
    this.cloud,
    this.iconCode,
    this.countryCode,
  );
}
