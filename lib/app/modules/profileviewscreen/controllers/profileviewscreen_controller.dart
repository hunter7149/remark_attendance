import 'package:attendance/app/modules/profileviewscreen/components/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileviewscreenController extends GetxController {
  //-----------------------------Important variables------------------------//
  RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;
  RxMap<String, dynamic> personalInformation = <String, dynamic>{}.obs;
  RxMap<String, dynamic> addressInfo = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> academicData = <Map<String, dynamic>>[].obs;
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

  academicInformationEditingController({required int index}) {
    ACADEMICCONTROLLERS edit = ACADEMICCONTROLLERS();

    edit.examName.text = "${academicData[index]['examName']} ";
    edit.group.text = "${academicData[index]['group']} ";
    edit.board.text = "${academicData[index]['board']} ";
    edit.institute.text = "${academicData[index]['institute']} ";
    edit.division.text = "${academicData[index]['division']} ";
    edit.passingYear.text = "${academicData[index]['passingYear']} ";
    edit.result.text = "${academicData[index]['result']} ";
    edit.outOf.text = "${academicData[index]['scale']} ";
    edit.copy.text = "${academicData[index]['copy']} ";
    return edit;
  }

//-----------------ACADEMIC INFO---------------------------------//
  singleAcademicDataRemove({required int index}) {
    academicData.removeAt(index);
    academicData.refresh();
    update();
  }

  singelAcademicDataUpdate(
      {required ACADEMICCONTROLLERS txtcnt, required int index}) {
    Map<String, dynamic> info = {
      "examName": txtcnt.examName.text,
      "group": txtcnt.group.text,
      "board": txtcnt.board.text,
      "institute": txtcnt.institute.text,
      "division": txtcnt.division.text,
      "passingYear": txtcnt.passingYear.text, // fixed typo here
      "result": txtcnt.result.text,
      "scale": txtcnt.outOf.text,
      "copy": txtcnt.copy.text,
    };

    Map<String, String> academicDataString = {};
    info.forEach((key, value) {
      academicDataString[key] = value.toString();
    });

    academicData[index] = academicDataString;
    academicData.refresh();
    print(
        "Academic data--> ${academicData} + type ${academicData.runtimeType} + ${info.runtimeType}");
    update();
  }

  singelAcademicDataAdd({required ACADEMICCONTROLLERS txtcnt}) {
    Map<String, dynamic> info = {
      "examName": txtcnt.examName.text,
      "group": txtcnt.group.text,
      "board": txtcnt.board.text,
      "institute": txtcnt.institute.text,
      "division": txtcnt.division.text,
      "passingYear": txtcnt.passingYear.text, // fixed typo here
      "result": txtcnt.result.text,
      "scale": txtcnt.outOf.text,
      "copy": txtcnt.copy.text,
    };

    Map<String, String> academicDataString = {};
    info.forEach((key, value) {
      academicDataString[key] = value.toString();
    });

    academicData.add(academicDataString);
    academicData.refresh();
    print(
        "Academic data--> ${academicData} + type ${academicData.runtimeType} + ${info.runtimeType}");
    update();
  }

  setData() {
    //---------------Clearing previous data for double safety--------------//
    userProfile.clear();
    personalInformation.clear();
    academicData.clear();
    addressInfo.clear();

    //--------------------Assigning new data-----------------------//
    dynamic data = Get.arguments;
    userProfile = data;
    userProfile.refresh();
    personalInformation.value = data['personal'];
    addressInfo.value = data['address'];
    academicData.value = data['academic'];

    //----------------------Refreshing all variables---------------//
    addressInfo.refresh();
    personalInformation.refresh();
    academicData.refresh();

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
