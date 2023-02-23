import 'package:get/get.dart';

import '../controllers/taskscreen_controller.dart';

class TaskscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskscreenController>(
      () => TaskscreenController(),
    );
  }
}
