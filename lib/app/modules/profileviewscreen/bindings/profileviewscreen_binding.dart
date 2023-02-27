import 'package:get/get.dart';

import '../controllers/profileviewscreen_controller.dart';

class ProfileviewscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileviewscreenController>(
      () => ProfileviewscreenController(),
    );
  }
}
