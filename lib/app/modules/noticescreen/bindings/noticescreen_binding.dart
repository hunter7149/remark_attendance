import 'package:get/get.dart';

import '../controllers/noticescreen_controller.dart';

class NoticescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticescreenController>(
      () => NoticescreenController(),
    );
  }
}
