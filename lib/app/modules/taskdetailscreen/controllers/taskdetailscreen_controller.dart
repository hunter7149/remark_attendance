import 'package:get/get.dart';

class TaskdetailscreenController extends GetxController {
  RxMap<String, dynamic> taskInfo = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> subtask = <Map<String, dynamic>>[{}].obs;
  initData({required dynamic data}) {
    taskInfo.clear();
    taskInfo.value = data ?? {} as Map<String, dynamic>;

    taskInfo.refresh();
    if (taskInfo.isNotEmpty) {
      subtask.clear();
      subtask.value = taskInfo['subtask']?.cast<Map<String, dynamic>>() ?? [{}];

      subtask.refresh();
      update();
    } else {
      Get.back();
    }
  }

  newDataSetter({required int index}) {
    taskInfo.clear();
    taskInfo.value = subtask[index];
    taskInfo.refresh();
    if (taskInfo.isNotEmpty) {
      subtask.clear();
      print(taskInfo['subtask'].runtimeType);
      subtask.value = taskInfo['subtask']?.cast<Map<String, dynamic>>() ?? [{}];

      subtask.refresh();
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
    dynamic data = Get.arguments;
    print(data['taskId']);
    initData(data: data);
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
