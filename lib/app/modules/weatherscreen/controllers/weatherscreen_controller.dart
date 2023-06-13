import 'dart:ui';

import 'package:attendance/app/api/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as gcode;

import '../../../data/globals/app_colors.dart';

class WeatherscreenController extends GetxController {
  RxDouble lattitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = "".obs;
  RxBool isLocationLoading = false.obs;

  getlocation() async {
    isLocationLoading.value = true;
    update();
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return LocationData;
      }
    }
    await location.changeSettings(
      accuracy: LocationAccuracy.high,
    );
    _locationData = await location.getLocation();
    // print(_locationData.latitude);

    LocationData locationData = _locationData;
    lattitude.value = locationData.latitude ?? 0.0;
    longitude.value = locationData.longitude ?? 0.0;
    update();

    List<gcode.Placemark> placemarks = await gcode.placemarkFromCoordinates(
        double.parse(lattitude.value.toStringAsFixed(4)),
        double.parse(longitude.value.toStringAsFixed(4)));
    address.value = "${placemarks[0].street}" +
        "," +
        "${placemarks[0].subLocality}" +
        "," +
        "${placemarks[0].locality}" +
        "-" +
        "${placemarks[0].postalCode}";
    isLocationLoading.value = false;
    // Map<String, dynamic> tempLocation = {
    //   "time": DateTime.now().toString().split(" ")[1],
    //   "lattitude": "${double.parse(lattitude.value.toStringAsFixed(4))}",
    //   "longitude": "${double.parse(longitude.value.toStringAsFixed(4))}",
    //   "name": address.value
    // };

    update();
    print("${address.value}");
    return locationData;
  }

  RxMap<String, dynamic> weatherData = <String, dynamic>{}.obs;
  RxBool isWeatherLoading = false.obs;

  Future<void> fetchWeatherData() async {
    isWeatherLoading.value = true;
    update();

    await permissionchecker();

    if (lattitude.value != 0.0 && longitude.value != 0.0) {
      try {
        final weatherResponse = await Repository().requestWeather(
          lattitude: lattitude.value,
          longitude: longitude.value,
        );

        if (weatherResponse != null) {
          print(weatherResponse);
          weatherData.value = weatherResponse;
          weatherData.refresh();
        }

        isWeatherLoading.value = false;
        update();
      } catch (e) {
        // Handle error
        print('Failed to fetch weather data: $e');
        isWeatherLoading.value = false;
        update();
      }
    }
  }

  onlyTime({required String dateString}) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('h:mm a').format(date);

    print(formattedDate); // Output: 6:00 PM

    return formattedDate;
  }

  permissionchecker() async {
    Location location = new Location();
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.granted) {
      print("has permission");
      await getlocation();
    } else {
      await userconsent();
    }
  }

  userconsent() {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Prominent Disclosure for Remark Attendance",
                          style: TextStyle(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: MediaQuery.of(Get.context!).size.height / 1.5,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Text(
                            "Prominent Disclosure for Remark Attendance \n Before you grant location access to Remark Attendance, please review the following information: \n This app collects location data to enable the following features: \n Employee attendance tracking: Allows us to record your location when you check-in or check-out of your workplace. \n Geo-fencing: Enables us to create virtual boundaries for designated work areas and provide location-based notifications. \n Route optimization: Helps us suggest the most efficient routes for employees traveling to different work locations."),
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () async {
                                Get.back();
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.modernSexyRed,
                                    borderRadius: BorderRadius.circular(2)),
                                alignment: Alignment.center,
                                child: Text("Decline",
                                    style: TextStyle(color: Colors.white)),
                              )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () async {
                                Get.back();
                                await getlocation();
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.modernGreen,
                                    borderRadius: BorderRadius.circular(2)),
                                alignment: Alignment.center,
                                child: Text("Allow",
                                    style: TextStyle(color: Colors.white)),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchWeatherData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
