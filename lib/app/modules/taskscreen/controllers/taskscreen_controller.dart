import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskscreenController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TextEditingController numberOfDays = TextEditingController(text: "1");
  TextEditingController reasonOfLeave = TextEditingController();
  TextEditingController addressDuringLeave = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

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
      int daysBetween = difference.inDays + 2; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
      update();
    } else if (endDate.isAtSameMomentAs(startDate)) {
      Duration difference = endDate.difference(startDate);
      int daysBetween = 1; // add 1 to include both dates

      numberOfDays.text = daysBetween.toString();
      daytimereseter();
      update();
    } else {
      Duration difference = endDate.difference(startDate);
      int daysBetween = difference.inDays + 2; // add 1 to include both dates

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

  RxString dropdownPriorityTypeValue = 'High'.obs;
  RxList<String> priorityType = <String>['High', 'Urgent', 'Normal'].obs;
  DropdownPriorityTypeValueUpdater(String type) {
    dropdownPriorityTypeValue.value = type;

    update();
  }

  RxBool isLeaveRequest = false.obs;
  RxList<Map<String, dynamic>> tasklist = <Map<String, dynamic>>[
    {
      "taskId": 101,
      "taskTitle": "Complete sales module",
      "taskDetails": "Complete sales module to confirm order",
      "taskProvider": "Abul Bashar Howlader",
      "taskAssignDate": "09-03-2023",
      "taskDeadline": "10-03-2023",
      "taskStatus": "Assigned",
      "taskPriority": "high",
    },
    {
      "taskId": 102,
      "taskTitle": "Setup flutter in laptop",
      "taskDetails": "Setup flutter enviroment in laptop",
      "taskProvider": "Abul Bashar Howlader",
      "taskAssignDate": "09-03-2023",
      "taskDeadline": "10-03-2023",
      "taskStatus": "Assigned",
      "taskPriority": "normal",
    }
  ].obs;

//----------------------------------------------Default Function-------------------------------//
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
