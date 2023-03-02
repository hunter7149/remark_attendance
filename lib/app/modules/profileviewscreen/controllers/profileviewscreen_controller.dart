import 'package:attendance/app/modules/profileviewscreen/components/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileviewscreenController extends GetxController {
  //-----------------------------Important variables------------------------//
  late RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;
  late RxMap<String, dynamic> personalInformation = <String, dynamic>{}.obs;
  late RxMap<String, dynamic> addressInfo = <String, dynamic>{}.obs;
  //-----------------Function that returns a object of multiple textfield for personal information section-------------//
  personalEditingController() {
    PERSONALCONTROLLERS pc = PERSONALCONTROLLERS();
    pc.name.text = personalInformation['empName'] ?? "";
    pc.dateOfBirth.text = personalInformation['empDob'] ?? "";
    pc.fatherName.text = personalInformation['empFather'] ?? "";
    pc.fatherProf.text = personalInformation['empFatherProf'] ?? "";
    pc.motherName.text = personalInformation['empMother'] ?? "";
    pc.motherProf.text = personalInformation['empMotherProf'] ?? "";
    pc.gender.text = personalInformation['gender'] ?? "";
    pc.bloodGroup.text = personalInformation['bloodGroup'] ?? "";
    pc.nationality.text = personalInformation['nationality'] ?? "";
    pc.nid.text = personalInformation['nid'] ?? "";
    pc.height.text = personalInformation['height'].toString() ?? "";
    pc.weight.text = personalInformation['weight'].toString() ?? "";
    pc.religion.text = personalInformation['religion'] ?? "";
    pc.tin.text = personalInformation['tinNo'] ?? "";
    pc.phone.text = personalInformation['phone'] ?? "";
    pc.email.text = personalInformation['email'] ?? "";
    pc.maritalStatus.text = personalInformation['maritalStatus'] ?? "";
    pc.spouseName.text = personalInformation['spouseName'] ?? "";
    pc.noOfChildren.text = personalInformation['noOfChildren'].toString() ?? "";
    pc.spouseDob.text = personalInformation['spouseDob'] ?? "";
    pc.childOneName.text = personalInformation['children1name'] ?? "";
    pc.childOneDob.text = personalInformation['children1dob'] ?? "";
    pc.childTwoName.text = personalInformation['children2name'] ?? "";
    pc.childTwoDob.text = personalInformation['children2dob'] ?? "";
    pc.passportNo.text = personalInformation['passport'] ?? "";
    pc.passportExp.text = personalInformation['passportExp'] ?? "";
    pc.drivingLicenseNo.text = personalInformation['drivingLicense'] ?? "";
    pc.drivingLicenseExp.text = personalInformation['drivingLicenseExp'] ?? "";

    return pc;
  }

//----------------------------Function to return text controllers-------------------------------//
  presentAddressEditingController() {
    ADDRESSCONTROLLERS present = ADDRESSCONTROLLERS();
    present.division.text = addressInfo['present']['division'] ?? "";
    present.district.text = addressInfo['present']['district'] ?? "";
    present.policeStation.text = addressInfo['present']['policeStation'] ?? "";
    present.postOffice.text = addressInfo['present']['postOffice'] ?? "";
    present.postCode.text = addressInfo['present']['postCode'].toString() ?? "";
    present.village.text = addressInfo['present']['village'] ?? "";
    return present;
  }

  permanentAddressEditingController() {
    ADDRESSCONTROLLERS permanent = ADDRESSCONTROLLERS();
    permanent.division.text = addressInfo['permanent']['division'] ?? "";
    permanent.district.text = addressInfo['permanent']['district'] ?? "";
    permanent.policeStation.text =
        addressInfo['permanent']['policeStation'] ?? "";
    permanent.postOffice.text = addressInfo['permanent']['postOffice'] ?? "";
    permanent.postCode.text =
        addressInfo['permanent']['postCode'].toString() ?? "";
    permanent.village.text = addressInfo['permanent']['village'] ?? "";
    return permanent;
  }

  setData() {
    dynamic data = Get.arguments;
    userProfile.clear();
    personalInformation.clear();
    userProfile = data;
    userProfile.refresh();
    addressInfo.clear();

    personalInformation.value = data['personal'];
    addressInfo.value = data['address'];

    addressInfo.refresh();

    personalInformation.refresh();

    update();

    print(personalInformation);
  }

  @override
  void onInit() {
    super.onInit();
    setData();
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
