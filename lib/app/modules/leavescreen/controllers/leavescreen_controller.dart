import 'package:attendance/app/api/repository/repository.dart';
import 'package:attendance/app/api/service/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeavescreenController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 1));
  TextEditingController numberOfDays = TextEditingController(text: "1");
  TextEditingController reasonOfLeave = TextEditingController();
  TextEditingController addressDuringLeave = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  RxMap<String, dynamic> leaveApplication = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> leaveHistory = <Map<String, dynamic>>[
    {"type": "Sick", "start_date": "10-12-21", "days": "2"},
    {"type": "Sick", "start_date": "01-11-21", "days": "1"},
    {"type": "Casual", "start_date": "23-11-21", "days": "2"},
    {"type": "Casual", "start_date": "30-09-21", "days": "1"},
    {"type": "Sick", "start_date": "15-08-21", "days": "3"}
  ].obs;

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

  requestApplication() async {
    String userId = Pref.readData(key: Pref.USER_ID).toString();

    String dateFormatter({required DateTime date}) {
      return DateFormat('MM/dd/yyyy').format(date).toString().split(" ")[0];
    }

    Map<String, dynamic> requestBody = {
      "alkpLeaveTypeIdAlkp": "${dropdownLeaveTypeValue.value.split("-")[0]}",
      "hrCrEmpIdHrCrEmp": "${userId}",
      "hrCrEmpRespnsblIdHrCrEmp": "${""}",
      "hrCrEmpEntryByIdHrCrEmp": "${userId}",
      "appDate":
          "${DateFormat('dd/MM/yyyy').format(DateTime.now()).toString().split(" ")[0]}",
      "endDate":
          "${DateFormat('dd/MM/yyyy').format(endDate).toString().split(" ")[0]}",
      "startDate":
          "${DateFormat('dd/MM/yyyy').format(startDate).toString().split(" ")[0]}",
      "addressDuringLeave": "${addressDuringLeave.text}",
      "contactNo": "${phoneNumber.text}",
      "reasonForLeave": "${reasonOfLeave.text}",
      "remarks": "${reasonOfLeave.text}",
    };
    print(requestBody);
    try {
      await Repository()
          .requestLeaveApplication(body: requestBody)
          .then((value) {
        print(value);
      });
    } on Exception catch (e) {}
    startDate = DateTime.now();
    endDate = DateTime.now().add(Duration(days: 1));
    numberOfDays.text = "1";
    reasonOfLeave.text = "";
    phoneNumber.text = "";
    addressDuringLeave.text = "";
    leaveApplication.value = requestBody;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    requestLeaveType();
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
