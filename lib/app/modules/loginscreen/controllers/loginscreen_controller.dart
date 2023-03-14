import 'package:attendance/app/api/service/connection_checker.dart';
import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../api/repository/repository.dart';

class LoginscreenController extends GetxController {
  RxBool obsecure = true.obs;

  obsecureUpdater() {
    obsecure.value = !obsecure.value;
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLogingIn = false.obs;
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
      if (await IEchecker.checker()) {
        isLogingIn.value = true;
        update();

        try {
          await Repository().requestLogin(map: {
            "username": email.text,
            "password": password.text
          }).then((value) async {
            print(value);
            if (value["result"] == "success" && value["accessToken"] != "") {
              Pref.writeData(
                  key: Pref.LOGIN_INFORMATION, value: value['accessToken']);
              Pref.writeData(key: Pref.USER_ID, value: email.text);
              Pref.writeData(key: Pref.USER_PASSWORD, value: password.text);
              isLogingIn.value = false;
              update();
              Get.offNamed(Routes.HOME);
            } else {
              isLogingIn.value = false;
              update();
              Get.snackbar("Failed", "Check username and password",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.BOTTOM);
            }
          });
        } on Exception catch (e) {
          isLogingIn.value = false;
          update();
        }
      } else {
        Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
            colorText: Colors.white,
            borderRadius: 2,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
      }
    }
    isLogingIn.value = false;
    update();
  }

  // isSignedIn() {
  //   if (Pref.readData(key: Pref.LOGIN_INFORMATION) != "" &&
  //       Pref.readData(key: Pref.LOGIN_INFORMATION) != null)
  //   //   email.text = Pref.readData(key: Pref.USER_ID) ?? "";
  //   // password.text = Pref.readData(key: Pref.USER_PASSWORD) ?? "";
  //   Get.offNamed(Routes.HOME);
  // }

  // requestLogin() {
  //   Get.offNamed(Routes.HOME);
  // }

  @override
  void onInit() {
    super.onInit();
    // isSignedIn();
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
