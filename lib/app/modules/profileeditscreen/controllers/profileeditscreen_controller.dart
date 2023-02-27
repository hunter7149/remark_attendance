import 'package:get/get.dart';

class ProfileeditscreenController extends GetxController {
  late RxMap<String, dynamic> userProfile;
  dynamic data;
  setData() {
    data = Get.arguments;
    userProfile = data;
    userProfile.refresh();
    update();
    print(userProfile);
  }

  @override
  void onInit() {
    super.onInit();
    setData();
    // print(Get.arguments[0]);
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
