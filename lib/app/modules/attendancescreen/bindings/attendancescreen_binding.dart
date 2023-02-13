import 'package:get/get.dart';

import '../controllers/attendancescreen_controller.dart';

class AttendancescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendancescreenController>(
      () => AttendancescreenController(),
    );
  }
}
