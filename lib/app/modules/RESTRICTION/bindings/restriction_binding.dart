import 'package:get/get.dart';

import '../controllers/restriction_controller.dart';

class RestrictionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestrictionController>(
      () => RestrictionController(),
    );
  }
}
