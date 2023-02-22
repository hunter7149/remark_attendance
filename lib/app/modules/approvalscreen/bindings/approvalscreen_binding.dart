import 'package:get/get.dart';

import '../controllers/approvalscreen_controller.dart';

class ApprovalscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApprovalscreenController>(
      () => ApprovalscreenController(),
    );
  }
}
