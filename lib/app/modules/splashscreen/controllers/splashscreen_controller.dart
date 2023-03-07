import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../api/service/prefrences.dart';

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
