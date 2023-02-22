import 'package:get/get.dart';

import '../controllers/movementscreen_controller.dart';

class MovementscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovementscreenController>(
      () => MovementscreenController(),
    );
  }
}
