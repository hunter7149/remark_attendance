import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeavescreenController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 1));
  TextEditingController numberOfDays = TextEditingController(text: "1");
  TextEditingController reasonOfLeave = TextEditingController();
  RxMap<String, dynamic> leaveApplication = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> leaveHistory = <Map<String, dynamic>>[
    {"type": "Sick", "start_date": "10-12-21", "days": "2"},
    {"type": "Sick", "start_date": "01-11-21", "days": "1"},
    {"type": "Casual", "start_date": "23-11-21", "days": "2"},
    {"type": "Casual", "start_date": "30-09-21", "days": "1"},
    {"type": "Sick", "start_date": "15-08-21", "days": "3"}
  ].obs;

  //----------------------------Drop down for apply leave-----------------------------//
  RxString dropdownLeaveTypeValue = 'Sick'.obs;
  RxList<String> leaveType = <String>[
    'Sick',
    'Casual',
    'Others',
  ].obs;
  DropdownLeaveTypeValueUpdater(String type) {
    dropdownLeaveTypeValue.value = type;

    update();
  }

  daysCounter() {
    Duration difference = endDate.difference(startDate);
    int daysBetween = difference.inDays;
    numberOfDays.text = daysBetween.toString();
    update();
  }

  requestApplication() {
    int days = int.tryParse(numberOfDays.text.toString()) ?? 1;
    leaveApplication.value = {
      "type": "${dropdownLeaveTypeValue.value}",
      "start_date":
          "${DateFormat('MM/dd/yyyy').format(startDate).toString().split(" ")[0]}",
      "days": "${days}",
      "reasonOfLeave": "${reasonOfLeave.text}",
      "status": "pending",
      "applicationDate":
          "${DateFormat('MM/dd/yyyy').format(DateTime.now()).toString().split(" ")[0]}"
    };
    startDate = DateTime.now();
    numberOfDays.text = "1";
    reasonOfLeave.text = "";
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
