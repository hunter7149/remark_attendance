import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as gcode;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class AttendancescreenController extends GetxController {
  RxBool isCheckedIn = false.obs;
  isCheckedInUpdater({required bool value}) {
    isCheckedIn.value = value;
    update();
  }

  RxString lastCheckIn = "".obs;
  lastCheckInUpdater({required String time}) {
    lastCheckIn.value = time;
    update();
  }

  RxString lastCheckOut = "".obs;
  lastCheckOutUpdater({required String time}) {
    lastCheckOut.value = time;
    update();
  }

  //-------------Function for updating history of attendance-----------//
  RxList<Map<String, dynamic>> attendanceHistory = <Map<String, dynamic>>[
    {
      "activity": "Check In",
      "intime":
          DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()).toString(),
      "outtime": DateFormat('MM/dd/yyyy hh:mm:ss a')
          .format(DateTime.now().add(Duration(hours: 6)))
          .toString(),
      "lattitude": "0.0",
      "longitude": "0.0",
      "status": "Attended",
    }
  ].obs;
  requestCheckIn() {
    isCheckedInUpdater(value: true);
    lastCheckInUpdater(
        time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
    attendanceHistory.add({
      "activity": "Check In",
      "intime":
          DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()).toString(),
      "outtime": DateFormat('MM/dd/yyyy hh:mm:ss a')
          .format(DateTime.now().add(Duration(hours: 6)))
          .toString(),
      "lattitude": "${lattitude.value}",
      "longitude": "${longitude.value}",
      "status": "Attended",
    });
    Get.closeAllSnackbars();
    Get.snackbar("Checked in", "Checked in at ${lastCheckIn.value}",
        colorText: Colors.white,
        borderRadius: 2,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade500,
        duration: Duration(seconds: 2));
    attendanceHistory.refresh();

    update();
  }

  requestCheckOut() {
    isCheckedInUpdater(value: false);
    lastCheckOutUpdater(
        time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
    attendanceHistory.add({
      "activity": "Check Out",
      "intime":
          DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()).toString(),
      "outtime": DateFormat('MM/dd/yyyy hh:mm:ss a')
          .format(DateTime.now().add(Duration(hours: 6)))
          .toString(),
      "lattitude": "${lattitude.value}",
      "longitude": "${longitude.value}",
      "status": "Attended",
    });
    print(longitude);
    print(lattitude);
    attendanceHistory.refresh();
    Get.closeAllSnackbars();
    Get.snackbar("Checked out", "Checked out at ${lastCheckOut.value}",
        colorText: Colors.white,
        borderRadius: 2,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 2));
    update();
  }

  RxDouble lattitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = "".obs;
  getLocation() async {
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

    _locationData = await location.getLocation();
    // print(_locationData.latitude);
    LocationData locationData = _locationData;
    lattitude.value = locationData.latitude ?? 0.0;
    longitude.value = locationData.longitude ?? 0.0;
    update();
    List<gcode.Placemark> placemarks =
        await gcode.placemarkFromCoordinates(lattitude.value, longitude.value);
    address.value =
        "${placemarks[0].subLocality}" + "," + "${placemarks[0].locality}";
    update();
    print("${placemarks[0].subLocality}" + "," + "${placemarks[0].locality}");
    return locationData;
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
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
