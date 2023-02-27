import 'package:get/get.dart';

import '../controllers/profileeditscreen_controller.dart';

class ProfileeditscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileeditscreenController>(
      () => ProfileeditscreenController(),
    );
  }
}
