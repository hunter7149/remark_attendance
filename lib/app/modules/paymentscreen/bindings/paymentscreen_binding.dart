import 'package:get/get.dart';

import '../controllers/paymentscreen_controller.dart';

class PaymentscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentscreenController>(
      () => PaymentscreenController(),
    );
  }
}
