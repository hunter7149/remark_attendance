import 'package:get/get.dart';

class TaskdetailscreenController extends GetxController {
  RxMap<String, dynamic> taskInfo = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> subtask = <Map<String, dynamic>>[{}].obs;
  initData({required dynamic data}) {
    taskInfo.clear();
    taskInfo.value = data;

    taskInfo.refresh();
    if (taskInfo.isEmpty) {
      Get.back();
    }
    subtask.clear();
    subtask.value = taskInfo['subtask'] as List<Map<String, dynamic>> ?? [];
    subtask.refresh();
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
