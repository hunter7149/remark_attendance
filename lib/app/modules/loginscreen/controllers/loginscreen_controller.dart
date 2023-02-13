import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginscreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obsecure = false.obs;
  obsecureUpdater() {
    obsecure.value = !obsecure.value;
  }

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
