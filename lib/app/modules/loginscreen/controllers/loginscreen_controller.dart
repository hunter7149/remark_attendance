import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../api/repository/repository.dart';

class LoginscreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obsecure = false.obs;
  obsecureUpdater() {
    obsecure.value = !obsecure.value;
  }

  dynamic data;
  requestTestData() async {
    await Repository().requestLogin(
        map: {"username": "M322", "password": "12345"}).then((value) {
      data = value;
      print(value);
      if (data["result"] == 1) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.HOME);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    requestTestData();
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
