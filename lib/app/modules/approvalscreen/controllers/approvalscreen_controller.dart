import 'package:get/get.dart';

class ApprovalscreenController extends GetxController {
  RxBool isCheckedIn = false.obs;
  isCheckedInUpdater({required bool value}) {
    isCheckedIn.value = value;
    update();
  }

//--------------------------------------------------Controller functions---------------------------------------------------------------------//
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
