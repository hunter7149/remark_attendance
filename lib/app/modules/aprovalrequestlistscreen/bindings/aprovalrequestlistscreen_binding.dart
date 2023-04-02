import 'package:get/get.dart';

import '../controllers/aprovalrequestlistscreen_controller.dart';

class AprovalrequestlistscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AprovalrequestlistscreenController>(
      () => AprovalrequestlistscreenController(),
    );
  }
}
