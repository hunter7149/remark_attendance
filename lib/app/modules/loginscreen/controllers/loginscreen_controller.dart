import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../api/repository/repository.dart';

class LoginscreenController extends GetxController {
  RxBool obsecure = false.obs;

  obsecureUpdater() {
    obsecure.value = !obsecure.value;
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  dynamic data;
  requestLogin() async {
    if (email.text.isEmpty) {
      Get.snackbar("Warning", "Username is empty!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    } else if (password.text.isEmpty) {
      Get.snackbar("Warning", "Password is empty!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      //m332-12345
      await Repository().requestLogin(map: {
        "username": email.text,
        "password": password.text
      }).then((value) async {
        print(value);
        if (value["result"] == "success") {
          Pref.writeData(
              key: Pref.LOGIN_INFORMATION, value: value['accessToken']);
          Pref.writeData(key: Pref.USER_ID, value: email.text);
          Get.offNamed(Routes.HOME);
        } else {
          Get.snackbar("Failed", "Check username and password",
              colorText: Colors.white,
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM);
        }
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    // requestLogin();
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
