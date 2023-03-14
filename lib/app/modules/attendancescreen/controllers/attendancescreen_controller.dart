import 'package:attendance/app/api/service/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as gcode;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:ntp/ntp.dart';

import '../../../api/repository/repository.dart';
import '../../../api/service/connection_checker.dart';

class AttendancescreenController extends GetxController {
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

//----------------------------Dropdown for movement type ------------------------------//

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
  RxBool isCheckingInOut = false.obs;
  requestCheckIn() async {
    if (await IEchecker.checker()) {
      // await CheckInOutSync();
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
        "alkpLeaveTypeId": 1,
        "leaveType": "IN",
        "remarks": "",
        "reason": "",
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

      //  {
      //   "hrCrEmpIdHrCrEmp": "${UserId}",
      //   "onDate":
      //       "${DateFormat('MM/dd/yyyy hh:mm:ss a').format(await NTP.now()).toString()}",
      //   "isPass": 0,
      //   "empLocation": "${address.value}",
      //   "attnType": "IN",
      //   "lattitude": lattitude.value,
      //   "longitude": longitude.value,
      // };
      if (lattitude != 0.0 && longitude != 0.0) {
        try {
          isCheckingInOut.value = true;
          update();
          await Repository().requestCheckIn(map: bindedData).then((value) {
            print("Check in api value ------------------- > ${value}");
            Pref.writeData(key: Pref.CHECKED_IN, value: true);
            isCheckedInUpdater(value: true);
            lastCheckInUpdater(
                time:
                    DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
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
          offlineCheckIn(bindedData: bindedData);
          isCheckingInOut.value = false;
          update();
        }
      } else {
        await getLocation();
        requestCheckIn();
      }
    } else {
      Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
          colorText: Colors.white,
          borderRadius: 2,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    }
  }

  offlineCheckIn({required Map<String, dynamic> bindedData}) {
    Pref.writeData(key: Pref.CHECK_IN_BACKUP, value: bindedData);
    Pref.writeData(key: Pref.CHECKED_IN, value: true);
    isCheckedInUpdater(value: true);

    lastCheckInUpdater(
        time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
    Get.snackbar(
        "Server error!", "CHEKCED IN OFFLINE!PLEASE SYNC WHEN SERVER AVAILABLE",
        colorText: Colors.white,
        borderRadius: 2,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 2));
  }

  offlineCheckOut({required Map<String, dynamic> bindedData}) {
    Pref.writeData(key: Pref.CHECK_OUT_BACKUP, value: bindedData);
    Pref.writeData(key: Pref.CHECKED_IN, value: false);
    isCheckedInUpdater(value: false);

    lastCheckInUpdater(
        time: DateFormat('MM/dd/yyyy hh:mm:ss a').format(DateTime.now()));
    Get.snackbar("Server error!",
        "CHEKCED OUT OFFLINE!PLEASE SYNC WHEN SERVER AVAILABLE",
        colorText: Colors.white,
        borderRadius: 2,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 2));
  }

  requestCheckOut() async {
    if (await IEchecker.checker()) {
      // await CheckInOutSync();
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
        "alkpLeaveTypeId": 1,
        "leaveType": "OUT",
        "remarks": "",
        "reason": "",
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
            update();
            Get.snackbar("Checked out", "Checked out at ${lastCheckIn.value}",
                colorText: Colors.white,
                borderRadius: 2,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.shade500,
                duration: Duration(seconds: 2));
          });
        } on Exception catch (e) {
          offlineCheckOut(bindedData: bindedData);
          isCheckingInOut.value = false;
          update();
        }
      } else {
        getLocation();
        requestCheckOut();
      }
    } else {
      Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
          colorText: Colors.white,
          borderRadius: 2,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
    }
  }

  CheckInOutSync() async {
    Map<String, dynamic> inData =
        Pref.readData(key: Pref.CHECK_IN_BACKUP) ?? {};
    Map<String, dynamic> outData =
        Pref.readData(key: Pref.CHECK_OUT_BACKUP) ?? {};

    if (inData.isEmpty && outData.isEmpty) {
      print("No sync available");
    } else {
      if (inData.isNotEmpty) {
        print("Check in sync available");
        try {
          await Repository().requestCheckIn(map: inData).then((value) {
            print("Check in api value ------------------- > ${value}");
            Pref.removeData(key: Pref.CHECK_IN_BACKUP);
            Get.snackbar("SYNC SUCCESS", "Successfully completed sync",
                colorText: Colors.white,
                borderRadius: 2,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.shade500,
                duration: Duration(seconds: 2));
          });
        } on Exception catch (e) {
          // Get.snackbar("Failed", "Try again",
          //     colorText: Colors.white,
          //     borderRadius: 2,
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.red.shade500,
          //     duration: Duration(seconds: 2));
        }
      }
      if (outData.isNotEmpty) {
        print("Check out sync available");
        try {
          await Repository().requestCheckIn(map: outData).then((value) {
            print("Check in api value ------------------- > ${value}");
            Pref.removeData(key: Pref.CHECK_OUT_BACKUP);
            Get.snackbar("SYNC SUCCESS", "Successfully completed sync",
                colorText: Colors.white,
                borderRadius: 2,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.shade500,
                duration: Duration(seconds: 2));
          });
        } on Exception catch (e) {
          // Get.snackbar("Failed", "Try again",
          //     colorText: Colors.white,
          //     borderRadius: 2,
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.red.shade500,
          //     duration: Duration(seconds: 2));
        }
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
        print("Recieved personal attendance ---->${value["value"]}");
        attendanceHistory.clear();
        attendanceHistory.value = value["value"] == [] ||
                value["value"] == null ||
                value["value"] == ""
            ? []
            : value["value"];
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
    CheckInOutSync();
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
