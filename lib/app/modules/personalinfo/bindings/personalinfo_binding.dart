import 'package:get/get.dart';

import '../controllers/personalinfo_controller.dart';

class PersonalinfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalinfoController>(
      () => PersonalinfoController(),
    );
  }
}
