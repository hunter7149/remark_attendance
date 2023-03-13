import 'package:attendance/app/api/service/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as gcode;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../api/repository/repository.dart';

class AttendancescreenController extends GetxController {
  //-------------- Movement code starts-------------------------//
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 1));
  dateChanger({required String value}) {
    startDate = DateTime.parse(value);
    print(startDate);
    update();
  }

  TextEditingController numberOfDays = TextEditingController(text: "1");
  TextEditingController reasonOfLeave = TextEditingController();
  TextEditingController responsibleEmpId = TextEditingController();
  TextEditingController addressDuringLeave = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
//-------------------------- Dropdown for movement nature -----------------------------//
  RxString dropdownMovementNatureValue = 'DAYLONG'.obs;
  RxList<String> movementNature = <String>['DAYLONG', 'HOURLY'].obs;
  DropdownMovementNatureValueUpdater(String type) {
    dropdownMovementNatureValue.value = type;

    update();
  }

//---------------------------------Dropdown for movement type--------------//
  RxString dropdownMovementTypeValue = 'Local'.obs;
  RxList<String> movementType = <String>['Local', 'Foreign'].obs;
  DropdownMovementTypeValueUpdater(String type) {
    dropdownMovementTypeValue.value = type;

    update();
  }

//----------------------Dropdown for transaction type------------------------//
  RxString dropdownTransactionTypeValue = 'REGULAR'.obs;
  RxList<String> TransactionType = <String>['REGULAR', 'CANCEL'].obs;
  DropdownTransactionTypeValueUpdater(String type) {
    dropdownTransactionTypeValue.value = type;

    update();
  }

//---------------------Dropdown for duration ----------------------//
  RxString dropdownDurationValue = '0'.obs;
  RxList<String> DurationValue =
      <String>['0', '1', '2', '3', '4', '5', '6', '7', '8'].obs;
  DropdownDurationValueUpdater(String type) {
    dropdownDurationValue.value = type;

    update();
  }

//----------------------------Dropdown for movement type ------------------------------//
  daysCounter() {
    Duration difference = endDate.difference(startDate);
    int daysBetween = difference.inDays;

    numberOfDays.text = (daysBetween).toString();
    daytimereseter();
    update();
  }

  daytimereseter() {
    if (int.parse(numberOfDays.text) < 1) {
      numberOfDays.text = "1";
      endDate = startDate.add(Duration(days: 1));
      update();
    }
  }

//------------------------------------------------Movement codes ends------------------------//
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
  RxList<dynamic> attendanceHistory = <dynamic>[].obs;
  RxBool isCheckingInOut = false.obs;
  requestCheckIn() async {
    String UserId = Pref.readData(key: Pref.USER_ID).toString();
    Map<String, dynamic> bindedData = {
      "hrCrEmpIdHrCrEmp": "${UserId}",
      "onDate":
          "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()).toString()}",
      "isPass": 0,
      "empLocation": "${address.value}",
      "attnType": "IN",
      "lattitude": lattitude.value,
      "longitude": longitude.value,
    };

    try {
      isCheckingInOut.value = true;
      update();
      await Repository().requestCheckIn(map: bindedData).then((value) {
        print("Check in api value ------------------- > ${value}");
        Pref.writeData(key: Pref.CHECKED_IN, value: true);
        isCheckedInUpdater(value: true);
        lastCheckInUpdater(
            time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
        isCheckingInOut.value = false;
        update();
        Get.snackbar("Checked in", "Checked in at ${lastCheckIn.value}",
            colorText: Colors.white,
            borderRadius: 2,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade500,
            duration: Duration(seconds: 2));
      });
    } on Exception catch (e) {
      isCheckingInOut.value = false;
      update();
      Get.snackbar("Failed", "Try again",
          colorText: Colors.white,
          borderRadius: 2,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    }
  }

  requestCheckOut() async {
    String UserId = Pref.readData(key: Pref.USER_ID).toString();
    Map<String, dynamic> bindedData = {
      "hrCrEmpIdHrCrEmp": "${UserId}",
      "onDate":
          "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()).toString()}",
      "isPass": 0,
      "empLocation": "${address.value}",
      "attnType": "OUT",
      "lattitude": lattitude.value,
      "longitude": longitude.value,
    };

    try {
      isCheckingInOut.value = true;
      update();

      await Repository().requestCheckIn(map: bindedData).then((value) {
        print("Check in api value ------------------- > ${value}");
        Pref.writeData(key: Pref.CHECKED_IN, value: false);
        isCheckedInUpdater(value: false);
        lastCheckOutUpdater(
            time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
        isCheckingInOut.value = false;
        update();
        Get.snackbar("Checked out", "Checked out at ${lastCheckIn.value}",
            colorText: Colors.white,
            borderRadius: 2,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade500,
            duration: Duration(seconds: 2));
      });
    } on Exception catch (e) {
      isCheckingInOut.value = false;
      update();
      Get.snackbar("Failed", "Try again",
          colorText: Colors.white,
          borderRadius: 2,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    }
  }

  RxBool isAttendanceLoading = false.obs;

  requestPersonalAttendance() async {
    String userId = Pref.readData(key: Pref.USER_ID).toString();
    try {
      isAttendanceLoading.value = true;
      update();
      await Repository()
          .getPersonalAttendance(employeeId: userId)
          .then((value) {
        print("Recieved personal attendance ---->${value["value"]}");
        attendanceHistory.clear();
        attendanceHistory.value = value["value"] ?? [];
        attendanceHistory.refresh();
        isAttendanceLoading.value = false;
        update();

        isAttendanceLoading.value = false;
        update();
      });
    } on Exception catch (e) {
      isAttendanceLoading.value = false;
      update();
      print("Error------at->Personal attendance exception--------> ${e}");
    }
    isAttendanceLoading.value = false;
    update();
  }

  RxDouble lattitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = "".obs;
  RxBool isLocationLoading = false.obs;

  getLocation() async {
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
    List<gcode.Placemark> placemarks =
        await gcode.placemarkFromCoordinates(lattitude.value, longitude.value);
    address.value = "${placemarks[0].street}" +
        "," +
        "${placemarks[0].subLocality}" +
        "," +
        "${placemarks[0].locality}" +
        "-" +
        "${placemarks[0].postalCode}";
    isLocationLoading.value = false;
    update();
    print("${address.value}");
    return locationData;
  }

  @override
  void onInit() {
    super.onInit();
    isCheckedInUpdater(value: Pref.readData(key: Pref.CHECKED_IN) ?? false);
    getLocation();
    requestPersonalAttendance();
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
