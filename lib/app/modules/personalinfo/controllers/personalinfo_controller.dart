import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PersonalinfoController extends GetxController {
  late RxMap<String, dynamic> userProfile;
  dynamic data;
  TextEditingController name = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController nid = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  setData() {
    data = Get.arguments;
    userProfile = data;
    userProfile.refresh();
    name.text = userProfile['personal']['empName'];
    dateOfBirth.text = userProfile['personal']['empDob'].toString();
    gender.text = userProfile['personal']['gender'];
    bloodGroup.text = userProfile['personal']['bloodGroup'];
    nationality.text = userProfile['personal']['nationality'];
    nid.text = userProfile['personal']['nid'].toString();
    height.text = userProfile['personal']['height'].toString();
    weight.text = userProfile['personal']['weight'].toString();
    phone.text = userProfile['personal']['phone'].toString();
    email.text = userProfile['personal']['email'].toString();

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
