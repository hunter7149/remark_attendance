import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather_icons/weather_icons.dart';

import '../controllers/weatherscreen_controller.dart';

class WeatherscreenView extends GetView<WeatherscreenController> {
  const WeatherscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Weather",
            backFunction: () {
              Get.back();
            }),
        body: Obx(() => controller.isWeatherLoading.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    child: SpinKitSquareCircle(
                      color: AppColors.modernDeepSea,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GradientText("Fetching weather data..",
                      colors: [AppColors.mainBlue, AppColors.modernGreen])
                ],
              )
            : SafeArea(
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            color: Color(0xFF035956),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "${controller.address}",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GradientText(
                              "${controller.weatherData["current_weather"]["temperature"]}${controller.weatherData["hourly_units"]["temperature_2m"]}",
                              colors: [
                                // AppColors.modernLightBrown,
                                AppColors.modernLightBrown,
                                AppColors.modernSexyRed,
                              ],
                              style: TextStyle(
                                  fontSize: 80, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.wind,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "${controller.weatherData["current_weather"]["windspeed"]} km/h",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GradientText(
                              COMMONWIDGET().getWeatherDescription(
                                  controller.weatherData["current_weather"]
                                      ["weathercode"]),
                              colors: [
                                // AppColors.modernLightBrown,
                                AppColors.modernBlue,
                                AppColors.modernCoolPink,
                              ],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hourly forecast",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Obx(() => controller.weatherData["hourly"]["time"].isEmpty
                          ? Container(
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/noweather.png",
                                      fit: BoxFit.cover,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Hourly forecast unavailable!",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.greyColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 200,
                              width: double.maxFinite,
                              child: ListView.builder(
                                  itemCount: 24,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      // height: 240,
                                      width: 130,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF035956),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.modernDeepSea)),
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                          GradientText(
                                            "${controller.onlyTime(dateString: controller.weatherData["hourly"]["time"][index])}",
                                            colors: [
                                              AppColors.modernLightBrown,
                                              AppColors.modernCoral,
                                            ],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.modernGreen),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Center(
                                              child: GradientText(
                                                "${controller.weatherData["hourly"]["temperature_2m"][index]}°C",
                                                //  "${controller.weatherData["hourly"]["relativehumidity_2m"][index]}",
                                                //  "${controller.weatherData["hourly"]["apparent_temperature"][index]}",
                                                //  "${controller.weatherData["hourly"]["temperature_2m"][index]}",
                                                colors: [
                                                  // AppColors.modernLightBrown,
                                                  AppColors.modernSexyRed,
                                                  AppColors.modernCoolPink,
                                                ],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ))
                    ],
                  ),
                ),
              ))));
  }
}
