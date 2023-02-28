import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileviewscreenController extends GetxController {
  late RxMap<String, dynamic> userProfile;
  dynamic data;

  //---------------------Controllers for personal information section----------------------//
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
  TextEditingController religion = TextEditingController();
  TextEditingController tin = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController fatherProf = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController motherProf = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController spouseName = TextEditingController();
  TextEditingController noOfChildren = TextEditingController();
  TextEditingController spouseDob = TextEditingController();
  TextEditingController childOneName = TextEditingController();
  TextEditingController childOneDob = TextEditingController();
  TextEditingController childTwoName = TextEditingController();
  TextEditingController childTwoDob = TextEditingController();
  TextEditingController passportNo = TextEditingController();
  TextEditingController passportExp = TextEditingController();
  TextEditingController drivingLicenseNo = TextEditingController();
  TextEditingController drivingLicenseExp = TextEditingController();
  //-------------------Controller for present address-------------------------//
  TextEditingController presentDivision = TextEditingController();
  TextEditingController presentDistrict = TextEditingController();
  TextEditingController presentPoliceStation = TextEditingController();
  TextEditingController presentPostOffice = TextEditingController();
  TextEditingController presentPostCode = TextEditingController();
  TextEditingController presentVillage = TextEditingController();
  //--------------------Controller for permanent address-----------------------//
  TextEditingController permanentDivision = TextEditingController();
  TextEditingController permanentDistrict = TextEditingController();
  TextEditingController permanentPoliceStation = TextEditingController();
  TextEditingController permanentPostOffice = TextEditingController();
  TextEditingController permanentPostCode = TextEditingController();
  TextEditingController permanentVillage = TextEditingController();
  //----------------------Controller for academic information----------------------//
  RxList<List<TextEditingController>> academicControllers =
      <List<TextEditingController>>[].obs;

  academicControllerAssign() {
    List<Map<String, dynamic>> data = userProfile["academic"];
    academicControllers.clear();
    data.forEach((e) {
      print("Key : ${e['examName']} ");
      TextEditingController examName =
          TextEditingController(text: "${e['examName']} ");
      TextEditingController group =
          TextEditingController(text: "${e['group']} ");
      TextEditingController board =
          TextEditingController(text: "${e['board']} ");
      TextEditingController institute =
          TextEditingController(text: "${e['institute']} ");
      TextEditingController division =
          TextEditingController(text: "${e['division']} ");
      TextEditingController passingYear =
          TextEditingController(text: "${e['passingYear']} ");
      TextEditingController result =
          TextEditingController(text: "${e['result']} ");
      TextEditingController outOf =
          TextEditingController(text: "${e['scale']} ");
      TextEditingController copy = TextEditingController(text: "${e['copy']} ");

      academicControllers.add([
        examName,
        group,
        board,
        institute,
        division,
        passingYear,
        result,
        outOf,
        copy
      ]);
      academicControllers.refresh();
      print(academicControllers);
    });
    update();
  }

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
    academicControllerAssign();
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

//   late RxMap<String, dynamic> userProfile;
//   dynamic data;
//   setData() {
//     data = Get.arguments;
//     userProfile = data;
//     userProfile.refresh();
//     update();
//     print(userProfile);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     setData();
//     // print(Get.arguments[0]);
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }
// }
