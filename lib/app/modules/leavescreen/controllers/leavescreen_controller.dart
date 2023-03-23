import 'package:attendance/app/api/repository/repository.dart';
import 'package:attendance/app/api/service/connection_checker.dart';
import 'package:attendance/app/api/service/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeavescreenController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
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
          List<dynamic> leaves = value['value'];
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
    } on Exception catch (e) {
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
      update();
    } else if (endDate.isAtSameMomentAs(startDate)) {
      Duration difference = endDate.difference(startDate);
      int daysBetween = 1; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
      update();
    } else if (startDate.add(Duration(days: 1)) == endDate) {
      numberOfDays.text = 2.toString();
      daytimereseter();
      update();
    } else {
      Duration difference = endDate.difference(startDate);
      int daysBetween = difference.inDays + 1; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
      update();
    }
  }

  daytimereseter() {
    if (int.parse(numberOfDays.text) < 1) {
      numberOfDays.text = "1";
      endDate = startDate.add(Duration(days: 1));
      update();
    }
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
              borderRadius: 2,
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
              borderRadius: 2,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.shade500,
              duration: Duration(seconds: 2));
        }
      });
    } on Exception catch (e) {
      Get.snackbar("Server error!", "TRY AGAIN WHEN SERVER AVAILABLE\n",
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          colorText: Colors.white,
          borderRadius: 2,
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
      } on Exception catch (e) {
        leaveHistory.value = [];
        leaveHistory.refresh();
        isLeaveHistory.value = false;
        update();
      }
    } else {
      Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
          colorText: Colors.white,
          backgroundColor: Colors.green,
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
    requestLeaveType();
    requestHistory();
    checkHistory();
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
