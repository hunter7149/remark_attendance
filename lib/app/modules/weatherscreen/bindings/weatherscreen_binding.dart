import 'package:get/get.dart';

import '../controllers/weatherscreen_controller.dart';

class WeatherscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherscreenController>(
      () => WeatherscreenController(),
    );
  }
}
