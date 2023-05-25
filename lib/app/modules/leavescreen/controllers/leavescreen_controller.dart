import 'package:attendance/app/api/repository/repository.dart';
import 'package:attendance/app/api/service/connection_checker.dart';
import 'package:attendance/app/api/service/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeavescreenController extends GetxController {
  TextEditingController numberOfDays = TextEditingController(text: "1");
  TextEditingController reasonOfLeave = TextEditingController();
  TextEditingController addressDuringLeave = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  RxMap<String, dynamic> leaveApplication = <String, dynamic>{}.obs;
  RxList<dynamic> leaveHistory = <dynamic>[].obs;

  //----------------------------Drop down for apply leave-----------------------------//
  RxString dropdownLeaveTypeValue = 'Select leave type'.obs;
  RxList<String> leaveType = <String>['Select leave type'].obs;

  String leaveTypeFinder({required String type}) {
    if (type == "") {
      return "";
    } else if (type == "") {
      return "";
    } else if (type == "") {
      return "";
    } else if (type == "") {
      return "";
    } else if (type == "") {
      return "";
    } else {
      return "";
    }
  }

  RxBool isLeaveTypeLoading = false.obs;
  requestLeaveType() async {
    String userId = Pref.readData(key: Pref.USER_ID).toString();
    try {
      isLeaveTypeLoading.value = true;
      update();
      await Repository().requestLeaveType(employeeId: userId).then((value) {
        print(value);
        if (value != null && value['value'] != null && value['value'] != []) {
          List<dynamic> leaves = value['value'] ?? [];
          leaveType.clear();
          DropdownLeaveTypeValueUpdater(
              "${leaves[0]['LEAVE_TYPE']}-(${leaves[0]['LEAVE_DAYS']} Days)");
          leaves.forEach((element) {
            leaveType.add(
                "${element['LEAVE_TYPE']}-(${element['LEAVE_DAYS']} Days)");
          });
          leaveType.refresh();
          update();
        }
      });
      isLeaveTypeLoading.value = false;
      update();
    } on Exception {
      leaveType.clear();
      isLeaveTypeLoading.value = false;
      update();
      // isLeaveTypeLoading.value = false;
      // update();
    }
  }

  DropdownLeaveTypeValueUpdater(String type) {
    dropdownLeaveTypeValue.value = type;

    update();
  }

  dateChanger({required String value}) {
    startDate = DateTime.parse(value);
    print(startDate);
    update();
  }

  DateTime startDate = DateTime.parse(DateTime.now().toString().split(" ")[0]);

  DateTime endDate = DateTime.parse(DateTime.now().toString().split(" ")[0]);
  void daysCounter() {
    if (endDate.isBefore(startDate)) {
      // Swap the start and end dates
      DateTime tempDate = startDate;
      startDate = endDate;
      endDate = tempDate;
      Duration difference = endDate.difference(startDate);
      int daysBetween = difference.inDays + 1; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
    } else if ((endDate.toString().split(" ")[0]) ==
        (startDate.toString().split(" ")[0])) {
      Duration difference = endDate.difference(startDate);
      int daysBetween = 1; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
    } else if (startDate.add(Duration(days: 1)).toString().split(" ")[0] ==
        endDate.toString().split(" ")[0]) {
      numberOfDays.text = 2.toString();
      daytimereseter();
    } else {
      Duration difference = endDate.difference(startDate);
      int daysBetween = difference.inDays + 1; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
    }
  }

  daytimereseter() {
    if (int.parse(numberOfDays.text) < 1) {
      numberOfDays.text = "1";
      startDate = DateTime.parse(DateTime.now().toString().split(" ")[0]);
      endDate = startDate.add(Duration(days: 1));
      update();
    } else {}
  }

  RxBool isLeaveRequest = false.obs;

  requestApplication() async {
    String userId = Pref.readData(key: Pref.USER_ID).toString();

    String dateFormatter({required DateTime date}) {
      return DateFormat('MM/dd/yyyy').format(date).toString().split(" ")[0];
    }

    Map<String, dynamic> requestBody = {
      "HrCrEmp": "${userId}",
      "hrCrEmpIdHrCrEmp": "${userId}",
      "startDate": "${DateFormat('dd/MM/yyyy').format(startDate)}",
      "endDate": "${DateFormat('dd/MM/yyyy').format(endDate)}",
      "entryDate": "${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
      "alkpLeaveTypeId": 0,
      "leaveType": "${dropdownLeaveTypeValue.value.split("-")[0]}",
      "remarks": "${reasonOfLeave.text}",
      "reason": "${reasonOfLeave.text}",
      "empLocation": "${addressDuringLeave.text}",
      "isPass": 0,
      "empCode": "",
      "resMobile": int.tryParse(phoneNumber.text) ?? 0,
      "longitude": 0.0,
      "latitude": 0.0,
      "splDuration": 0,
      "startHour": 0,
      "startMin": 0,
    };
    // {
    //   "alkpLeaveTypeIdAlkp": "${dropdownLeaveTypeValue.value.split("-")[0]}",
    //   "hrCrEmpIdHrCrEmp": "${userId}",
    //   "hrCrEmpRespnsblIdHrCrEmp": "${""}",
    //   "hrCrEmpEntryByIdHrCrEmp": "${userId}",
    //   "appDate":
    //       "${DateFormat('dd/MM/yyyy').format(DateTime.now()).toString().split(" ")[0]}",
    //   "endDate":
    //       "${DateFormat('dd/MM/yyyy').format(endDate).toString().split(" ")[0]}",
    //   "startDate":
    //       "${DateFormat('dd/MM/yyyy').format(startDate).toString().split(" ")[0]}",
    //   "addressDuringLeave": "${addressDuringLeave.text}",
    //   "contactNo": "${phoneNumber.text}",
    //   "reasonForLeave": "${reasonOfLeave.text}",
    //   "remarks": "${reasonOfLeave.text}",
    // };
    print(requestBody);
    try {
      isLeaveRequest.value = true;
      update();
      await Repository()
          .requestLeaveApplication(body: requestBody)
          .then((value) {
        if (value["value"].toString() == "-1" || value['value'] == "") {
          Get.snackbar("Failed!", "${value["result"]}",
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              colorText: Colors.white,
              borderRadius: 0,
              animationDuration: Duration(seconds: 0),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade500,
              duration: Duration(seconds: 2));
        } else {
          leaveApplication.clear();
          leaveApplication.value = requestBody;
          leaveApplication.refresh();
          Pref.writeData(key: Pref.LATEST_LEAVE, value: requestBody);
          isLeaveRequest.value = false;
          update();
          Get.back();
          Get.snackbar("Success!", "${value["result"]}",
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              colorText: Colors.white,
              borderRadius: 0,
              animationDuration: Duration(seconds: 0),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.shade500,
              duration: Duration(seconds: 2));
        }
      });
    } on Exception {
      Get.snackbar("Server error!", "TRY AGAIN WHEN SERVER AVAILABLE\n",
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade500,
          duration: Duration(seconds: 2));
      isLeaveRequest.value = false;
      update();
    }
    startDate = DateTime.now();
    endDate = DateTime.now().add(Duration(days: 1));
    numberOfDays.text = "1";
    reasonOfLeave.text = "";
    phoneNumber.text = "";
    addressDuringLeave.text = "";
    isLeaveRequest.value = false;
    update();
    update();
  }

  RxBool isLeaveHistory = false.obs;
  requestHistory() async {
    if (await IEchecker.checker()) {
      try {
        isLeaveHistory.value = true;
        update();
        await Repository()
            .requestHitory(body: {"leaveType": "LEAVE"}).then((value) {
          if (value["value"] != [] || value["value"] != null) {
            leaveHistory.clear();
            leaveHistory.value = value['value'] ?? [];
            leaveHistory.refresh();
            update();
            isLeaveHistory.value = false;
            update();
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
          backgroundColor: Colors.red,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  resetApplicationLoading() {
    isLeaveRequest.value = false;
    update();
  }

  checkHistory() {
    leaveApplication.value = Pref.readData(key: Pref.LATEST_LEAVE) ?? {};
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // startDate = DateTime.now();
    requestLeaveType();
    requestHistory();
    checkHistory();
    // daysCounter();
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
