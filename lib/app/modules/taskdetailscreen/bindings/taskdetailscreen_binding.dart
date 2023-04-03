import 'package:get/get.dart';

import '../controllers/taskdetailscreen_controller.dart';

class TaskdetailscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskdetailscreenController>(
      () => TaskdetailscreenController(),
    );
  }
}
