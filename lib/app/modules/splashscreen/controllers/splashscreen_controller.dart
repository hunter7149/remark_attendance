import 'dart:async';

import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../api/service/prefrences.dart';
import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  RxString device_id = 'Unknown'.obs;
  Future<void> saveDeviceInfo() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    device_id.value = deviceId ?? "n/a";
    update();

    Pref.writeData(key: Pref.DEVICE_IDENTITY, value: device_id.value);

    print(
        "Device id-------------------------------------${Pref.readData(key: Pref.DEVICE_IDENTITY)}");
  }

  isSignedIn() {
    if (Pref.readData(key: Pref.LOGIN_INFORMATION) != "" &&
        Pref.readData(key: Pref.LOGIN_INFORMATION) != null) {
      bool restrictionstatus =
          Pref.readData(key: Pref.RESTRICTION_STATUS) ?? false;
      if (restrictionstatus) {
        Get.toNamed(Routes.RESTRICTION);
      } else {
        dynamic data = Pref.readData(key: Pref.USER_PROFILE) ?? {};
        Get.offNamed(Routes.HOME, arguments: {"data": data});
      }
    } else {
      Get.offNamed(Routes.LOGINSCREEN);
    }
    //   email.text = Pref.readData(key: Pref.USER_ID) ?? "";
    // password.text = Pref.readData(key: Pref.USER_PASSWORD) ?? "";
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
