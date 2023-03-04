import 'package:attendance/app/modules/profileviewscreen/components/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileviewscreenController extends GetxController {
  //-----------------------------Important variables------------------------//
  RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;
  RxMap<String, dynamic> personalInformation = <String, dynamic>{}.obs;
  RxMap<String, dynamic> addressInfo = <String, dynamic>{}.obs;
  RxList<Map<String, dynamic>> academicData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> experienceData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> trainningData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> healthData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> languageData = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> contactPersonnel = <String, dynamic>{}.obs;
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

//----------------------------DYNAMIC TEXT CONTROLLERS-------------------------------//
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

  experienceInformationEditingController({required int index}) {
    EXPERIENCECONTROLLERS edit = EXPERIENCECONTROLLERS();

    edit.organization.text = "${experienceData[index]['organization']} ";
    edit.department.text = "${experienceData[index]['department']} ";
    edit.jobTitle.text = "${experienceData[index]['jobTitle']} ";
    edit.startDate.text = "${experienceData[index]['startDate']} ";
    edit.endDate.text = "${experienceData[index]['endDate']} ";
    edit.tenure.text = "${experienceData[index]['tenure']} ";
    edit.reason.text = "${experienceData[index]['reason']} ";
    edit.responsibility.text = "${experienceData[index]['responsibility']} ";

    return edit;
  }

  contactPersonnelEditingController({required String title}) {
    CONTACTPERSONNELCONTROLLERS edit = CONTACTPERSONNELCONTROLLERS();

    edit.contactName.text = "${contactPersonnel[title]['name']} ";
    edit.organization.text = "${contactPersonnel[title]['organization']} ";
    edit.contactNo.text = "${contactPersonnel[title]['contactNo']} ";
    // edit.contactNo.text = "${contactPersonnel[title]['startDate']} ";
    edit.emailAddress.text = "${contactPersonnel[title]['email']} ";
    edit.address.text = "${contactPersonnel[title]['address']} ";
    edit.nidNo.text = "${contactPersonnel[title]['nid']} ";
    edit.relation.text = "${contactPersonnel[title]['relation']} ";

    return edit;
  }

  trainingEditingController({required int index}) {
    TRAININGINFORMATIONCONTROLLERS edit = TRAININGINFORMATIONCONTROLLERS();

    edit.trainingName.text = "${trainningData[index]['name']} ";
    edit.trainingType.text = "${trainningData[index]['type']} ";
    edit.instituteName.text = "${trainningData[index]['institute']} ";
    edit.startDate.text = "${trainningData[index]['startDate']} ";
    edit.endDate.text = "${trainningData[index]['endDate']} ";
    edit.duration.text = "${trainningData[index]['duration']} ";
    edit.copy.text = "${trainningData[index]['copy']} ";

    return edit;
  }

  healthEditingController({required int index}) {
    HEALTHINFORMATIONCONTROLLERS edit = HEALTHINFORMATIONCONTROLLERS();
    edit.healthIssueType.text = "${healthData[index]['issueType']} ";
    edit.medication.text = "${healthData[index]['description']} ";
    edit.report.text = "${healthData[index]['prescriptiom']} ";
    return edit;
  }

  languageEditingController({required int index}) {
    LANGUAGECONTROLLERS edit = LANGUAGECONTROLLERS();
    edit.languageName.text = "${languageData[index]['name']} ";
    edit.speaking.text = "${languageData[index]['speaking']} ";
    edit.reading.text = "${languageData[index]['reading']} ";
    edit.writing.text = "${languageData[index]['writing']} ";
    edit.understanding.text = "${languageData[index]['understanding']} ";
    edit.remarks.text = "${languageData[index]['remarks']} ";

    return edit;
  }

//-----------------ACADEMIC INFORMATION---------------------------------//
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

//---------------------EXPERIENCE INFORMATION---------------------------------//
  singleExperienceDataRemove({required int index}) {
    experienceData.removeAt(index);
    experienceData.refresh();
    update();
  }

  singelExperienceDataUpdate(
      {required EXPERIENCECONTROLLERS txtcnt, required int index}) {
    Map<String, dynamic> info = {
      "organization": txtcnt.organization.text,
      "department": txtcnt.department.text,
      "jobTitle": txtcnt.jobTitle.text,
      "startDate": txtcnt.startDate.text,
      "endDate": txtcnt.endDate.text,
      "tenure": txtcnt.tenure.text, // fixed typo here

      "reason": txtcnt.reason.text,
      "responsibility": txtcnt.responsibility.text,
    };

    Map<String, String> experienceDataString = {};
    info.forEach((key, value) {
      experienceDataString[key] = value.toString();
    });

    experienceData[index] = experienceDataString;
    experienceData.refresh();
    print(
        "experience data--> ${experienceData} + type ${experienceData.runtimeType} + ${info.runtimeType}");
    update();
  }

  singelExperienceDataAdd({required EXPERIENCECONTROLLERS txtcnt}) {
    Map<String, dynamic> info = {
      "organization": txtcnt.organization.text,
      "department": txtcnt.department.text,
      "jobTitle": txtcnt.jobTitle.text,
      "startDate": txtcnt.startDate.text,
      "endDate": txtcnt.endDate.text,
      "tenure": txtcnt.tenure.text, // fixed typo here

      "reason": txtcnt.reason.text,
      "responsibility": txtcnt.responsibility.text,
    };

    Map<String, String> experienceDataString = {};
    info.forEach((key, value) {
      experienceDataString[key] = value.toString();
    });

    experienceData.add(experienceDataString);
    experienceData.refresh();
    print(
        "experience data--> ${experienceData} + type ${experienceData.runtimeType} + ${info.runtimeType}");
    update();
  }
//----------------------------------------------------------------------------------------//

//------------------------------------Contact personnel-----------------------------------//
  singelContactPersonnelDataUpdate(
      {required CONTACTPERSONNELCONTROLLERS txtcnt,
      required String jsonTitle}) {
    Map<String, dynamic> info = {
      "name": txtcnt.contactName.text,
      "organization": txtcnt.organization.text,
      "contactNo": txtcnt.contactNo.text,
      "email": txtcnt.emailAddress.text,
      "address": txtcnt.address.text,
      "nid": txtcnt.nidNo.text,
      "relation": txtcnt.relation.text, // fixed typo here
    };

    Map<String, String> contactPersonnelDataString = {};
    info.forEach((key, value) {
      contactPersonnelDataString[key] = value.toString();
    });

    contactPersonnel[jsonTitle] = contactPersonnelDataString;
    contactPersonnel.refresh();
    print(
        "experience data--> ${contactPersonnel} + type ${contactPersonnel.runtimeType} + ${info.runtimeType}");
    update();
  }

//----------------------------------------------------------------------------------------//

//-----------------------------------Training information--------------------------------//
  singleTrainingDataRemove({required int index}) {
    trainningData.removeAt(index);
    trainningData.refresh();
    update();
  }

  singelTrainingDataUpdate(
      {required TRAININGINFORMATIONCONTROLLERS txtcnt, required int index}) {
    Map<String, dynamic> info = {
      "name": txtcnt.trainingName.text,
      "type": txtcnt.trainingType.text,
      "institute": txtcnt.instituteName.text,
      "startDate": txtcnt.startDate.text,
      "endDate": txtcnt.endDate.text,
      "duration": txtcnt.duration.text, // fixed typo here

      "copy": txtcnt.copy.text,
    };

    Map<String, String> trainingDataString = {};
    info.forEach((key, value) {
      trainingDataString[key] = value.toString();
    });

    trainningData[index] = trainingDataString;
    trainningData.refresh();
    print(
        "experience data--> ${trainningData} + type ${trainningData.runtimeType} + ${info.runtimeType}");
    update();
  }

  singelTrainingDataAdd({required TRAININGINFORMATIONCONTROLLERS txtcnt}) {
    Map<String, dynamic> info = {
      "name": txtcnt.trainingName.text,
      "type": txtcnt.trainingType.text,
      "institute": txtcnt.instituteName.text,
      "startDate": txtcnt.startDate.text,
      "endDate": txtcnt.endDate.text,
      "duration": txtcnt.duration.text, // fixed typo here

      "copy": txtcnt.copy.text,
    };

    Map<String, String> trainingDataString = {};
    info.forEach((key, value) {
      trainingDataString[key] = value.toString();
    });

    trainningData.add(trainingDataString);
    trainningData.refresh();
    print(
        "trainning --> ${trainningData} + type ${trainningData.runtimeType} + ${info.runtimeType}");
    update();
  }

//--------------------------------------------------------------------------------------//

//------------------------------Health information-------------------------------------//
  singleHealthDataRemove({required int index}) {
    healthData.removeAt(index);
    healthData.refresh();
    update();
  }

  singelHealthDataUpdate(
      {required HEALTHINFORMATIONCONTROLLERS txtcnt, required int index}) {
    Map<String, dynamic> info = {
      "issueType": txtcnt.healthIssueType.text,
      "description": txtcnt.medication.text,
      "prescriptiom": txtcnt.report.text,
    };

    Map<String, String> healthDataString = {};
    info.forEach((key, value) {
      healthDataString[key] = value.toString();
    });

    healthData[index] = healthDataString;
    healthData.refresh();
    print(
        "Health data--> ${healthData} + type ${healthData.runtimeType} + ${info.runtimeType}");
    update();
  }

  singelHealthDataAdd({required HEALTHINFORMATIONCONTROLLERS txtcnt}) {
    Map<String, dynamic> info = {
      "issueType": txtcnt.healthIssueType.text,
      "description": txtcnt.medication.text,
      "prescriptiom": txtcnt.report.text,
    };

    Map<String, String> healthDataString = {};
    info.forEach((key, value) {
      healthDataString[key] = value.toString();
    });

    healthData.add(healthDataString);
    healthData.refresh();
    print(
        "Health data--> ${healthData} + type ${healthData.runtimeType} + ${info.runtimeType}");
    update();
  }

//-------------------------------------------------------------------------------------//

//---------------------------Language data--------------------------------------------//
  singleLanguageDataRemove({required int index}) {
    languageData.removeAt(index);
    languageData.refresh();
    update();
  }

  singelLanguageDataUpdate(
      {required LANGUAGECONTROLLERS txtcnt, required int index}) {
    Map<String, dynamic> info = {
      "name": txtcnt.languageName.text,
      "speaking": txtcnt.speaking.text,
      "reading": txtcnt.reading.text,
      "writing": txtcnt.writing.text,
      "understanding": txtcnt.understanding.text,
      "remarks": txtcnt.remarks.text,
    };

    Map<String, String> languageDataString = {};
    info.forEach((key, value) {
      languageDataString[key] = value.toString();
    });

    languageData[index] = languageDataString;
    languageData.refresh();
    print(
        "Lanhguage data--> ${healthData} + type ${healthData.runtimeType} + ${info.runtimeType}");
    update();
  }

  singelLanguageDataAdd({required LANGUAGECONTROLLERS txtcnt}) {
    Map<String, dynamic> info = {
      "name": txtcnt.languageName.text,
      "speaking": txtcnt.speaking.text,
      "reading": txtcnt.reading.text,
      "writing": txtcnt.writing.text,
      "understanding": txtcnt.understanding.text,
      "remarks": txtcnt.remarks.text,
    };

    Map<String, String> languageDataString = {};
    info.forEach((key, value) {
      languageDataString[key] = value.toString();
    });

    languageData.add(languageDataString);
    languageData.refresh();
    print(
        "language data--> ${languageData} + type ${languageData.runtimeType} + ${info.runtimeType}");
    update();
  }

//-----------------------------------------------------------------------------------//
  setData() {
    //---------------Clearing previous data for double safety--------------//
    userProfile.clear();
    personalInformation.clear();
    academicData.clear();
    addressInfo.clear();
    experienceData.clear();
    contactPersonnel.clear();
    trainningData.clear();
    healthData.clear();
    languageData.clear();

    //--------------------Assigning new data-----------------------//
    dynamic data = Get.arguments;
    userProfile = data;
    userProfile.refresh();
    personalInformation.value = data['personal'] ?? [];
    addressInfo.value = data['address'] ?? [];
    academicData.value = data['academic'] ?? [];
    experienceData.value = data['experience'] ?? [];
    contactPersonnel.value = data['contacts'] ?? {};
    trainningData.value = data['training'] ?? [];
    healthData.value = data['healthinfo'] ?? [];
    languageData.value = data['languages'] ?? [];
    //----------------------Refreshing all variables---------------//
    addressInfo.refresh();
    personalInformation.refresh();
    academicData.refresh();
    experienceData.refresh();
    contactPersonnel.refresh();
    trainningData.refresh();
    healthData.refresh();
    languageData.refresh();

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
