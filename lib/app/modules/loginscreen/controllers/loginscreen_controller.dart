import 'package:attendance/app/api/service/connection_checker.dart';
import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    } else if (password.text.isEmpty) {
      Get.snackbar("Warning", "Password is empty!",
          colorText: Colors.white,
          borderRadius: 0,
          animationDuration: Duration(seconds: 0),
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
            dynamic data = value["value"] ?? {};
            if (data != {}) {
              Pref.writeData(key: Pref.USER_PROFILE, value: data);
            }
            if (value["result"] == "success" && value["accessToken"] != "") {
              Pref.writeData(
                  key: Pref.LOGIN_INFORMATION, value: value['accessToken']);
              Pref.writeData(key: Pref.USER_ID, value: email.text);
              Pref.writeData(key: Pref.USER_PASSWORD, value: password.text);
              isLogingIn.value = false;
              update();
              firebaseStore();
              Get.offNamed(Routes.HOME, arguments: {"data": data});
            } else {
              isLogingIn.value = false;
              update();
              Get.snackbar("Failed", "${value['result'] ?? "Try again"}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.BOTTOM);
            }
          });
        } on Exception catch (e) {
          isLogingIn.value = false;
          update();
          Get.snackbar("SERVER ERROR", "TRY AGAIN LATER",
              colorText: Colors.white,
              borderRadius: 0,
              animationDuration: Duration(seconds: 0),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade500,
              duration: Duration(seconds: 2));
        }
      } else {
        Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
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
  firebaseStore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference stringsCollection = firestore.collection('fcm_token');
    try {
      await stringsCollection.doc("${email.text}").set({
        'device': Pref.readData(key: Pref.DEVICE_IDENTITY).toString(),
        'token': Pref.readData(key: Pref.FCM_TOKEN).toString(),
        'userId': "${email.text}"
      });
      print('String uploaded successfully');
    } catch (e) {
      print('Error uploading string: $e');
    }
  }

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
