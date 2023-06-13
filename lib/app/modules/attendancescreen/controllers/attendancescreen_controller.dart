import 'dart:ui';

import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/modules/home/controllers/home_controller.dart';
import 'package:attendance/app/modules/sync/checkinoutsync.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart' as gcode;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:ntp/ntp.dart';

import '../../../api/repository/repository.dart';
import '../../../api/service/connection_checker.dart';
import '../../../data/globals/app_colors.dart';

class AttendancescreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  scrollToLast() {
    scrollController.animateTo(
      scrollController.position.extentInside,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  //************************************************Movement codes starts************************************************//
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
  TextEditingController remarks = TextEditingController();
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

//-----------------------------Dropdown for hour----------------------//
  RxString dropdownHourValue = 'Hour'.obs;
  RxList<String> HourValue = <String>[
    'Hour',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24'
  ].obs;
  DropdownHourValueUpdater(String type) {
    dropdownHourValue.value = type;

    update();
  }

  //---------------------Dropdown for minutes-----------------//
  RxString dropdownMinuteValue = 'Minute'.obs;
  RxList<String> MinuteValue = <String>[
    'Minute',
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
  ].obs;
  DropdownMinuteValueUpdater(String type) {
    dropdownMinuteValue.value = type;

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

  RxBool isMovemementReq = false.obs;
  requestMovement() async {
    if (dropdownHourValue.value == "Hour") {
      Get.snackbar("EMPTY DATA", "PLEASE SEELCT START HOUR",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    } else if (dropdownMinuteValue.value == "Minute") {
      Get.snackbar("EMPTY DATA", "PLEASE SEELCT START MINUTE",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    } else if (dropdownDurationValue.value == "Minute") {
      Get.snackbar("EMPTY DATA", "PLEASE SEELCT DURATION",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    } else {
      String UserId = Pref.readData(key: Pref.USER_ID).toString();

      Map<String, dynamic> bindedData = {
        "HrCrEmp": "${UserId}",
        "hrCrEmpIdHrCrEmp": "${UserId}",
        "startDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(startDate).toString()}",
        "endDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(endDate).toString()}",
        "entryDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(await NTP.now()).toString()}",
        "alkpLeaveTypeId": 0,
        "leaveType": "TOUR",
        "remarks": "${remarks.text}",
        "reason": "${reasonOfLeave.text}",
        "empLocation": "${address.value}",
        "isPass": 0,
        "empCode": "",
        "resMobile": int.tryParse(phoneNumber.text) ?? 0,
        "longitude": longitude.value,
        "latitude": lattitude.value,
        "splDuration": int.tryParse(dropdownDurationValue.value) ?? 0,
        "startHour": int.tryParse(dropdownHourValue.value) ?? 0,
        "startMin": int.tryParse(dropdownMinuteValue.value) ?? 0,
      };

      if (await IEchecker.checker()) {
        try {
          isMovemementReq.value = true;
          update();
          await Repository().requestApplication(body: bindedData).then((value) {
            isMovemementReq.value = false;
            update();
            print(value);
            Get.back();

            if (value["value"].toString() != "-1") {
              Get.snackbar(
                  "SUCCESS", "${value['result'] ?? "REQUEST ACCEPTED"}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.shade500,
                  duration: Duration(seconds: 2));
            } else {
              Get.snackbar(
                  "SUCCESS", "${value['result'] ?? "REQUEST ACCEPTED"}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.shade500,
                  duration: Duration(seconds: 2));
            }
          });
        } on Exception {
          isMovemementReq.value = false;
          update();
          Get.snackbar("ERROR", "SERVER ERROR",
              colorText: Colors.white,
              borderRadius: 0,
              animationDuration: Duration(seconds: 0),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade500,
              duration: Duration(seconds: 2));
        }
      } else {
        isMovemementReq.value = false;
        update();
        Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
      }
    }
  }

  RxList<dynamic> mleaveHistory = <dynamic>[].obs;
  RxBool ismLeaveHistory = false.obs;
  requesMovmenttHistory() async {
    if (await IEchecker.checker()) {
      try {
        ismLeaveHistory.value = true;
        update();
        await Repository()
            .requestHitory(body: {"leaveType": "TOUR"}).then((value) {
          if (value["value"] != [] &&
              value["value"] != null &&
              value["value"] != "") {
            mleaveHistory.clear();
            mleaveHistory.value = value['value'] ?? [];
            mleaveHistory.refresh();
            update();
            ismLeaveHistory.value = false;
            update();
          } else {
            if (value['result']
                .toString()
                .contains("Username And password Not")) {
              Get.put(HomeController());
              Get.find<HomeController>().requestSignOut();
            }
          }
        });
      } on Exception {
        mleaveHistory.value = [];
        mleaveHistory.refresh();
        ismLeaveHistory.value = false;
        update();
      }
    } else {
      Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

//************************************************Movement codes ends************************************************//

  //************************************************Short leave codes starts************************************************//

  DateTime shortLeaveStartDate = DateTime.now();
  sdateChanger({required String value}) {
    startDate = DateTime.parse(value);
    print(startDate);
    update();
  }

  TextEditingController sreasonOfLeave = TextEditingController();
  TextEditingController sresponsibleEmpId = TextEditingController();

  TextEditingController sphoneNumber = TextEditingController();
  TextEditingController sremarks = TextEditingController();

//---------------------Dropdown for duration ----------------------//
  DateTime sstartDate = DateTime.now();
  RxString dropdownsDurationValue = 'Minute'.obs;
  RxList<String> sDurationValue = <String>[
    "Minute",
    "30",
    "40",
    "50",
    "60",
    "70",
    "80",
    "90",
    "100",
    "110",
    "120",
    "130",
    "140",
    "150",
    "160",
    "170",
    "180",
    "190",
    "200",
    "210",
    "220",
    "230",
    "240",
    "250",
    "260",
    "270",
  ].obs;
  DropdownsDurationValueUpdater(String type) {
    dropdownsDurationValue.value = type;

    update();
  }

//-----------------------------Dropdown for hour----------------------//
  RxString dropdownsHourValue = 'Hour'.obs;
  RxList<String> sHourValue = <String>[
    'Hour',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24'
  ].obs;
  DropdownsHourValueUpdater(String type) {
    dropdownsHourValue.value = type;

    update();
  }

  //---------------------Dropdown for minutes-----------------//
  RxString dropdownsMinuteValue = 'Minute'.obs;
  RxList<String> sMinuteValue = <String>[
    'Minute',
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
  ].obs;
  DropdownsMinuteValueUpdater(String type) {
    dropdownsMinuteValue.value = type;

    update();
  }

  RxBool isShortLeaveLoading = false.obs;
  requestShortLeave() async {
    if (dropdownsHourValue.value == "Hour") {
      Get.snackbar("EMPTY DATA", "PLEASE SEELCT START HOUR",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    } else if (dropdownsMinuteValue.value == "Minute") {
      Get.snackbar("EMPTY DATA", "PLEASE SEELCT START MINUTE",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    } else if (dropdownsDurationValue.value == "Minute") {
      Get.snackbar("EMPTY DATA", "PLEASE SEELCT DURATION",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    } else {
      String UserId = Pref.readData(key: Pref.USER_ID).toString();

      Map<String, dynamic> bindedData = {
        "HrCrEmp": "${UserId}",
        "hrCrEmpIdHrCrEmp": "${UserId}",
        "startDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(await NTP.now()).toString()}",
        "endDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(await NTP.now()).toString()}",
        "entryDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(await NTP.now()).toString()}",
        "alkpLeaveTypeId": 0,
        "leaveType": "SPL",
        "remarks": "${sremarks.text}",
        "reason": "${sreasonOfLeave.text}",
        "empLocation": "${address.value}",
        "isPass": 0,
        "empCode": "",
        "resMobile": int.tryParse(sphoneNumber.text) ?? 0,
        "longitude": longitude.value,
        "latitude": lattitude.value,
        "splDuration": int.tryParse(dropdownsDurationValue.value) ?? 0,
        "startHour": int.tryParse(dropdownsHourValue.value) ?? 0,
        "startMin": int.tryParse(dropdownsMinuteValue.value) ?? 0,
      };

      if (await IEchecker.checker()) {
        try {
          isShortLeaveLoading.value = true;
          update();
          await Repository().requestApplication(body: bindedData).then((value) {
            isShortLeaveLoading.value = false;
            update();
            print(value);
            if (value["value"].toString() != "-1") {
              Get.snackbar(
                  "SUCCESS", "${value['result'] ?? "REQUEST ACCEPTED"}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.shade500,
                  duration: Duration(seconds: 2));
            }
          });
        } on Exception {
          isShortLeaveLoading.value = false;
          update();
          Get.snackbar("ERROR", "SERVER ERROR",
              colorText: Colors.white,
              borderRadius: 0,
              animationDuration: Duration(seconds: 0),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade500,
              duration: Duration(seconds: 2));
        }
      } else {
        isShortLeaveLoading.value = false;
        update();
        Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
      }
    }
  }

  RxList<dynamic> leaveHistory = <dynamic>[].obs;
  RxBool isLeaveHistory = false.obs;
  requestHistory() async {
    if (await IEchecker.checker()) {
      try {
        isLeaveHistory.value = true;
        update();
        await Repository()
            .requestHitory(body: {"leaveType": "SPL"}).then((value) {
          if (value["value"] != [] &&
              value["value"] != null &&
              value["value"] != "") {
            leaveHistory.clear();
            leaveHistory.value = value['value'] ?? [];
            leaveHistory.refresh();
            update();
            isLeaveHistory.value = false;
            update();
          } else {
            if (value['result']
                .toString()
                .contains("Username And password Not")) {
              Get.put(HomeController());
              Get.find<HomeController>().requestSignOut();
            }
          }
        });
      } on Exception {
        leaveHistory.value = [];
        leaveHistory.refresh();
        isLeaveHistory.value = false;
        update();
      }
    } else {
      Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //************************************************Short leave codes ends************************************************//
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
  RxMap<String, dynamic> latestActivity = <String, dynamic>{}.obs;
  RxBool isCheckingInOut = false.obs;
  requestCheckIn() async {
    if (await IEchecker.checker()) {
      // userconsent();
      await permissionchecker();
      String UserId = Pref.readData(key: Pref.USER_ID).toString();
      DateTime currentTime =
          await IEchecker.checker() ? await NTP.now() : await DateTime.now();
      Map<String, dynamic> bindedData = {
        "HrCrEmp": "${UserId}",
        "hrCrEmpIdHrCrEmp": "${UserId}",
        "startDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
        "endDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
        "entryDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
        "alkpLeaveTypeId": 1,
        "leaveType": "IN",
        "remarks": "",
        "reason": "",
        // "empLocation": "Simpletree Anarkali,Gulshan,Dhaka-1212",
        // "isPass": 0,
        // "empCode": "",
        // "resMobile": 0,
        // "longitude": 90.4165467,
        // "latitude": 23.7868417,
        "empLocation": "${address.value}",
        "isPass": 0,
        "empCode": "",
        "resMobile": 0,
        "longitude": longitude.value,
        "latitude": lattitude.value,
        "splDuration": 0,
        "startHour": 0,
        "startMin": 0,
      };

      if (lattitude != 0.0 && longitude != 0.0) {
        try {
          isCheckingInOut.value = true;
          update();
          await Repository().requestCheckIn(map: bindedData).then((value) {
            print("Check in api value ------------------- > ${value}");
            if (value["value"].toString() != "-1") {
              Pref.writeData(key: Pref.CHECKED_IN, value: true);
              isCheckedInUpdater(value: true);
              lastCheckInUpdater(
                  time: DateFormat('MM/dd/yyyy hh:mm:ss a')
                      .format(DateTime.now()));
              isCheckingInOut.value = false;
              latestActivity.clear();
              latestActivity.value = {
                "title": "CHECKED IN",
                "time": "${bindedData['startDate']}",
                "mode": "ONLINE",
                "date": DateTime.now().toString().split(" ")[0],
              };
              latestActivity.refresh;
              Pref.writeData(key: Pref.LATEST_CHECK, value: latestActivity);
              update();

              Get.snackbar("Checked in", "Checked in at ${lastCheckIn.value}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.shade500,
                  duration: Duration(seconds: 2));
            } else {
              Get.snackbar("ERROR!", "${value["result"]}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.shade500,
                  duration: Duration(seconds: 2));
            }
          });
        } on Exception {
          offlineCheckIn(bindedData: bindedData);
          isCheckingInOut.value = false;
          update();
        }
      } else {
        Get.snackbar("No location", "Please turn on location and try again",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
        await permissionchecker();
        // requestCheckIn();
      }
    } else {
      await permissionchecker();
      if (lattitude != 0.0 && longitude != 0.0) {
        String UserId = Pref.readData(key: Pref.USER_ID).toString();
        DateTime currentTime =
            await IEchecker.checker() ? await NTP.now() : await DateTime.now();
        Map<String, dynamic> bindedData = {
          "HrCrEmp": "${UserId}",
          "hrCrEmpIdHrCrEmp": "${UserId}",
          "startDate":
              "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
          "endDate":
              "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
          "entryDate":
              "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
          "alkpLeaveTypeId": 1,
          "leaveType": "IN",
          "remarks": "",
          "reason": "",
          // "empLocation": "Simpletree Anarkali,Gulshan,Dhaka-1212",
          // "isPass": 0,
          // "empCode": "",
          // "resMobile": 0,
          // "longitude": 90.4165467,
          // "latitude": 23.7868417,
          "empLocation": "${address.value}",
          "isPass": 0,
          "empCode": "",
          "resMobile": 0,
          "longitude": longitude.value,
          "latitude": lattitude.value,
          "splDuration": 0,
          "startHour": 0,
          "startMin": 0,
        };
        offlineCheckIn(bindedData: bindedData);
        isCheckingInOut.value = false;
        update();
      } else {
        Get.closeAllSnackbars();
        Get.snackbar("No location", "Please turn on location and try again",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
        await permissionchecker();
      }
      //No internet??
    }
  }

  offlineCheckIn({required Map<String, dynamic> bindedData}) {
    List<dynamic> previousData = Pref.readData(key: Pref.CHECK_IN_BACKUP) ?? [];
    previousData.add(bindedData);
    Pref.writeData(key: Pref.CHECK_IN_BACKUP, value: previousData);
    Pref.writeData(key: Pref.CHECKED_IN, value: true);
    isCheckedInUpdater(value: true);
    latestActivity.clear();
    latestActivity.value = {
      "title": "CHECKED IN",
      "time": "${bindedData['startDate']}",
      "mode": "OFFLINE",
      "date": DateTime.now().toString().split(" ")[0],
    };
    latestActivity.refresh;
    Pref.writeData(key: Pref.LATEST_CHECK, value: latestActivity);
    lastCheckInUpdater(
        time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
    Get.snackbar(
        "Server error!", "CHEKCED IN OFFLINE!PLEASE SYNC WHEN SERVER AVAILABLE",
        colorText: Colors.white,
        borderRadius: 0,
        animationDuration: Duration(seconds: 0),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 2));
  }

  offlineCheckOut({required Map<String, dynamic> bindedData}) async {
    List<dynamic> previousCheckOut =
        Pref.readData(key: Pref.CHECK_OUT_BACKUP) ?? [];
    kDebugMode ? print(previousCheckOut) : () {};
    previousCheckOut.add(bindedData);
    Pref.writeData(key: Pref.CHECK_OUT_BACKUP, value: previousCheckOut);
    Pref.writeData(key: Pref.CHECKED_IN, value: false);
    isCheckedInUpdater(value: false);
    latestActivity.clear();
    latestActivity.value = {
      "title": "CHECKED OUT",
      "time": "${bindedData['startDate']}",
      "mode": "OFFLINE",
      "date": DateTime.now().toString().split(" ")[0],
    };
    latestActivity.refresh;
    Pref.writeData(key: Pref.LATEST_CHECK, value: latestActivity);
    lastCheckInUpdater(
        time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
    Get.snackbar("Server error!",
        "CHEKCED OUT OFFLINE!PLEASE SYNC WHEN SERVER AVAILABLE",
        colorText: Colors.white,
        borderRadius: 0,
        animationDuration: Duration(seconds: 0),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 2));
  }

  requestCheckOut() async {
    if (await IEchecker.checker()) {
      String UserId = Pref.readData(key: Pref.USER_ID).toString();
      DateTime currentTime =
          await IEchecker.checker() ? await NTP.now() : await DateTime.now();
      Map<String, dynamic> bindedData = {
        "HrCrEmp": "${UserId}",
        "hrCrEmpIdHrCrEmp": "${UserId}",
        "startDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
        "endDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
        "entryDate":
            "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
        "alkpLeaveTypeId": 1,
        "leaveType": "OUT",
        "remarks": "",
        "reason": "",
        //         "empLocation": "Simpletree Anarkali,Gulshan,Dhaka-1212",
        // "isPass": 0,
        // "empCode": "",
        // "resMobile": 0,
        // "longitude": 90.4165467,
        // "latitude": 23.7868417,
        "empLocation": "${address.value}",
        "isPass": 0,
        "empCode": "",
        "resMobile": 0,
        "longitude": longitude.value,
        "latitude": lattitude.value,
        "splDuration": 0,
        "startHour": 0,
        "startMin": 0,
      };
      // {
      //   "hrCrEmpIdHrCrEmp": "${UserId}",
      //   "onDate":
      //       "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()).toString()}",
      //   "isPass": 0,
      //   "empLocation": "${address.value}",
      //   "attnType": "OUT",
      //   "lattitude": lattitude.value,
      //   "longitude": longitude.value,
      // };
      if (lattitude != 0.0 && longitude != 0.0) {
        try {
          isCheckingInOut.value = true;
          update();

          await Repository().requestCheckIn(map: bindedData).then((value) {
            print("Check in api value ------------------- > ${value}");
            Pref.writeData(key: Pref.CHECKED_IN, value: false);
            isCheckedInUpdater(value: false);
            lastCheckOutUpdater(
                time:
                    DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
            isCheckingInOut.value = false;
            latestActivity.clear();
            latestActivity.value = {
              "title": "CHECKED OUT",
              "time": "${bindedData['startDate']}",
              "mode": "ONLINE",
              "date": DateTime.now().toString().split(" ")[0],
            };
            latestActivity.refresh;
            Pref.writeData(key: Pref.LATEST_CHECK, value: latestActivity);
            update();
            Get.snackbar(
                "Checked out", "Checked out at ${bindedData['startDate']}",
                colorText: Colors.white,
                borderRadius: 0,
                animationDuration: Duration(seconds: 0),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.shade500,
                duration: Duration(seconds: 2));
          });
        } on Exception {
          offlineCheckOut(bindedData: bindedData);
          isCheckingInOut.value = false;
          update();
        }
      } else {
        Get.snackbar("No location", "Please turn on location and try again",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
        await permissionchecker();
        // requestCheckOut();
      }
    } else {
      if (lattitude.value != 0.0 && longitude.value != 0.0) {
        String UserId = Pref.readData(key: Pref.USER_ID).toString();
        DateTime currentTime =
            await IEchecker.checker() ? await NTP.now() : await DateTime.now();
        Map<String, dynamic> bindedData = {
          "HrCrEmp": "${UserId}",
          "hrCrEmpIdHrCrEmp": "${UserId}",
          "startDate":
              "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
          "endDate":
              "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
          "entryDate":
              "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(currentTime).toString()}",
          "alkpLeaveTypeId": 1,
          "leaveType": "OUT",
          "remarks": "",
          "reason": "",
          //         "empLocation": "Simpletree Anarkali,Gulshan,Dhaka-1212",
          // "isPass": 0,
          // "empCode": "",
          // "resMobile": 0,
          // "longitude": 90.4165467,
          // "latitude": 23.7868417,
          "empLocation": "${address.value}",
          "isPass": 0,
          "empCode": "",
          "resMobile": 0,
          "longitude": longitude.value,
          "latitude": lattitude.value,
          "splDuration": 0,
          "startHour": 0,
          "startMin": 0,
        };
        offlineCheckOut(bindedData: bindedData);
        isCheckingInOut.value = false;
        update();
        // Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
        //     colorText: Colors.white,
        //     borderRadius: 0,
        //     animationDuration: Duration(seconds: 0),
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.red.shade500,
        //     duration: Duration(seconds: 2));
      } else {
        Get.snackbar("No location", "Please turn on location and try again",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
        await permissionchecker();
      }
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
        if (value['result'].toString().contains("Username And password Not")) {
          Get.put(HomeController());
          Get.find<HomeController>().requestSignOut();
        }
        print("Recieved personal attendance ---->${value["value"]}");
        attendanceHistory.clear();
        attendanceHistory.value = value["value"] == [] &&
                value["value"] == null &&
                value["value"] == ""
            ? []
            : value["value"];
        attendanceHistory.refresh();
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

  resetActivityDaily() {
    Map<String, dynamic> data = Pref.readData(key: Pref.LATEST_CHECK) ?? {};
    if (data.isNotEmpty) {
      DateTime recievedDate = DateTime.parse(data['date']);
      DateTime currentDate =
          DateTime.parse(DateTime.now().toString().split(" ")[0]);
      if (recievedDate.isBefore(currentDate)) {
        print(
            "[----------------------------Check in/out button reseted to default !--------------------]");
        isCheckedInUpdater(value: false);
      }
    }
  }

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
    if (await IEchecker.checker()) {
      List<gcode.Placemark> placemarks = await gcode.placemarkFromCoordinates(
              double.parse(lattitude.value.toStringAsFixed(4)),
              double.parse(longitude.value.toStringAsFixed(4))) ??
          [];
      address.value = "${placemarks[0].street}" +
          "," +
          "${placemarks[0].subLocality}" +
          "," +
          "${placemarks[0].locality}" +
          "-" +
          "${placemarks[0].postalCode}";
      isLocationLoading.value = false;
    } else {
      address.value = "${lattitude.value},${longitude.value}";
      isLocationLoading.value = false;
    }
    update();
    Map<String, dynamic> tempLocation = {
      "time": DateTime.now().toString().split(" ")[1],
      "lattitude": "${double.parse(lattitude.value.toStringAsFixed(4))}",
      "longitude": "${double.parse(longitude.value.toStringAsFixed(4))}",
      "name": address.value
    };
    debugList.add(tempLocation);
    debugList.refresh();
    update();
    print("${address.value}");
    return locationData;
  }

  checkLatest() {
    latestActivity.value = Pref.readData(key: Pref.LATEST_CHECK) ?? {};

    update();
  }

  //----------------Weather Code------------//

  RxMap<String, dynamic> weatherData = <String, dynamic>{}.obs;
  RxBool isWeatherLoading = false.obs;

  requestWeather() async {
    isWeatherLoading.value = true;
    update();

    if (lattitude.value != 0.0 && longitude.value != 0.0) {
      if (await IEchecker.checker()) {
        await Repository()
            .requestWeather(
                lattitude: lattitude.value, longitude: longitude.value)
            .then((value) {
          if (value != null) {
            print(value);
            weatherData.value = value;
            weatherData.refresh();
          }
          isWeatherLoading.value = false;
          update();
        });
      }
    }
  }

  permissionchecker() async {
    Location location = new Location();
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.granted) {
      print("has permission");
      await getlocation();
      await requestWeather();
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

  //------------Debug module---------------//

  RxList<Map<String, dynamic>> debugList = <Map<String, dynamic>>[].obs;

  runDebugCode() {}
  @override
  Future<void> onInit() async {
    super.onInit();
    isCheckedInUpdater(value: Pref.readData(key: Pref.CHECKED_IN) ?? false);

    await requestPersonalAttendance();
    await CHECKINOUTSYNC().CheckInOutSync();
    permissionchecker();
    // initAttendance();
    await checkLatest();
    await resetActivityDaily();
    await requestHistory();
    await requesMovmenttHistory();
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
