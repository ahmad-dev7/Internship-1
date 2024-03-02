import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/components/gradient_background.dart';
import 'package:weather_forecast/components/greeting_text.dart';
import 'package:weather_forecast/components/image_path_provider.dart';
import 'package:weather_forecast/components/location_chip.dart';
import 'package:weather_forecast/components/details_tile.dart';
import 'package:weather_forecast/controller/data_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String getTime({required String sinceEpoch, bool? date}) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        int.parse(sinceEpoch) * 1000,
      );
      String formattedTime =
          DateFormat("hh:mm a").format(dateTime).toLowerCase();
      String formattedDate = DateFormat("EEEE d, hh:mm a").format(dateTime);
      return date != null ? formattedDate : formattedTime;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 110,
        title: Obx(
          () => Wrap(
            direction: Axis.vertical,
            children: [
              const GreetingText(),
              LocationChip(
                cityName: controller.cityName.value,
                countryCode: controller.countryCode.value,
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Stack(
          children: [
            const GradientBackground(),
            Container(
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 90),
              child: Stack(
                children: [
                  // Image shadow
                  Positioned(
                    top: 15,
                    left: 8,
                    child: Obx(
                      () => Image.asset(
                        getImage(controller.iconCode.value),
                        height: MediaQuery.of(context).size.width - 30,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  // Image
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 20),
                    child: Obx(
                      () => Image.asset(
                        getImage(controller.iconCode.value),
                        height: MediaQuery.of(context).size.width - 30,
                      ),
                    ),
                  ),
                  // Temperature, description, time
                  Positioned.fill(
                    bottom: -20,
                    child: Align(
                      child: Obx(
                        () => Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            // Temperature
                            Text(
                              "${controller.temperature.value} \u2103",
                              style: GoogleFonts.lato(
                                shadows: [
                                  const BoxShadow(
                                    offset: Offset(15, 10),
                                    color: Colors.black87,
                                    blurRadius: 40,
                                  )
                                ],
                                fontSize: 100,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Description
                            Text(
                              controller.weatherDescription.value,
                              style: GoogleFonts.cinzel(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // Time
                            Text(
                              getTime(
                                sinceEpoch: controller.dateTimeSinceEpoch.value,
                                date: true,
                              ),
                              style: GoogleFonts.rajdhani(
                                color: Colors.white70,
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Extra information
                  Positioned(
                    bottom: 2,
                    left: 0,
                    right: 0,
                    child: Obx(
                      () => Wrap(
                        children: [
                          //? Sunrise and Sunset
                          DetailsTile(
                            heading: 'Sunrise',
                            info: getTime(
                              sinceEpoch:
                                  controller.sunriseTimeSinceEpoch.value,
                            ),
                            imagePath: 'images/sunrise.png',
                          ),
                          DetailsTile(
                            heading: 'Sunset',
                            info: getTime(
                              sinceEpoch: controller.sunsetTimeSinceEpoch.value,
                            ),
                            imagePath: 'images/sunset.png',
                          ),
                          const Divider(color: Colors.white54, thickness: .3),
                          //? Humidity and Pressure
                          DetailsTile(
                            heading: 'Humidity',
                            info: '${controller.humidity.value} %',
                            imagePath: 'images/humidity.png',
                          ),
                          DetailsTile(
                            heading: 'Pressure',
                            info: '${controller.pressure.value} hPa',
                            imagePath: 'images/pressure.png',
                          ),
                          const Divider(color: Colors.white54, thickness: .3),
                          //? Wind speed and Cloud
                          DetailsTile(
                            heading: 'Wind',
                            info: '${controller.windSpeed} km/h',
                            imagePath: 'images/wind_speed.png',
                          ),
                          DetailsTile(
                            heading: 'Clouds',
                            info: '${controller.cloud}  %',
                            imagePath: 'images/cloud.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
