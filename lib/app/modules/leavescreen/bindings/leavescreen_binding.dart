import 'package:get/get.dart';

import '../controllers/leavescreen_controller.dart';

class LeavescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeavescreenController>(
      () => LeavescreenController(),
    );
  }
}
