import 'package:get/get.dart';

class TaskscreenController extends GetxController {
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
