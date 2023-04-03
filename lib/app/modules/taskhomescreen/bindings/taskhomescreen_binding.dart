import 'package:get/get.dart';

import '../controllers/taskhomescreen_controller.dart';

class TaskhomescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskhomescreenController>(
      () => TaskhomescreenController(),
    );
  }
}
