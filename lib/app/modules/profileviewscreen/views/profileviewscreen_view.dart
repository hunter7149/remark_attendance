import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/globals/app_colors.dart';
import '../controllers/profileviewscreen_controller.dart';

class ProfileviewscreenView extends GetView<ProfileviewscreenController> {
  const ProfileviewscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Profile",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Column(children: [
            personalInfoSection(
                controller: controller,
                context: context,
                color: AppColors.modernGreen),
            SizedBox(
              height: 20,
            ),
            presentAddressInfoSection(
                controller: controller,
                context: context,
                color: AppColors.mainBlue),
            SizedBox(
              height: 20,
            )
          ])),
        )));
  }

  textView({required String text}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w400),
    );
  }

  //----------------Common input field----------------------------//
  commonTextField(
      {required TextEditingController controller,
      required String title,
      bool? enabled}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.sexySkyBlue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: COMMONWIDGET.commonTextEdit(
                hinttext: title,
                controller: controller,
                obsecure: false,
                enabled: enabled ?? true),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  personalInfoSection(
      {required ProfileviewscreenController controller,
      required BuildContext context,
      required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.03),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                personalRow(
                    label: "Employee name:",
                    controller: controller.name,
                    hinttext: "Name"),
                personalRow(
                    label: "Employee date of birth:",
                    controller: controller.dateOfBirth,
                    hinttext: "Date of birth"),
                personalRow(
                    label: "Gender :",
                    controller: controller.gender,
                    hinttext: "Gender"),
                personalRow(
                    label: "Blood group :",
                    controller: controller.bloodGroup,
                    hinttext: "Blood group"),
                personalRow(
                    label: "Mobile :",
                    controller: controller.phone,
                    hinttext: "Mobile number"),
                personalRow(
                    label: "Email :",
                    controller: controller.email,
                    hinttext: "Email"),
                personalRow(
                    label: "Father's name :",
                    controller: controller.fatherName,
                    hinttext: "Fathers's name"),
                personalRow(
                    label: "Father's profession :",
                    controller: controller.fatherProf,
                    hinttext: "Father's profession"),
                personalRow(
                    label: "Mother's name :",
                    controller: controller.motherName,
                    hinttext: "Mohter's name"),
                personalRow(
                    label: "Mother's profession :",
                    controller: controller.motherProf,
                    hinttext: "Mother's proffesion"),
                personalRow(
                    label: "Nationality :",
                    controller: controller.nationality,
                    hinttext: "Nationality"),
                personalRow(
                    label: "Nid:",
                    controller: controller.nid,
                    hinttext: "National Identification Card(NID)"),
                personalRow(
                    label: "Height :",
                    controller: controller.height,
                    hinttext: "Height"),
                personalRow(
                    label: "Weight :",
                    controller: controller.weight,
                    hinttext: "Weight"),
                personalRow(
                    label: "Religion :",
                    controller: controller.religion,
                    hinttext: "Religion"),
                personalRow(
                    label: "TIN :",
                    controller: controller.tin,
                    hinttext: "TIN"),
                personalRow(
                    label: "Marital status :",
                    controller: controller.maritalStatus,
                    hinttext: "Marital status"),
                personalRow(
                    label: "Spouse name :",
                    controller: controller.spouseName,
                    hinttext: "Spouse name"),
                personalRow(
                    label: "Spouse date of birth :",
                    controller: controller.spouseDob,
                    hinttext: "Spouse date of birth"),
                personalRow(
                    label: "Number of children :",
                    controller: controller.noOfChildren,
                    hinttext: "Number of children"),
                personalRow(
                    label: "Children 1 name :",
                    controller: controller.childOneName,
                    hinttext: "Children 1 name"),
                personalRow(
                    label: "Children 1 date of birth :",
                    controller: controller.childOneDob,
                    hinttext: "Children 1 date of birth"),
                personalRow(
                    label: "Children 2 name :",
                    controller: controller.childTwoName,
                    hinttext: "Children 2 name"),
                personalRow(
                    label: "Children 2 date of birth :",
                    controller: controller.childTwoDob,
                    hinttext: "Children 2 date of birth"),
                personalRow(
                    label: "Passport no:",
                    controller: controller.passportNo,
                    hinttext: "Passport no"),
                personalRow(
                    label: "Passport expiry:",
                    controller: controller.passportExp,
                    hinttext: "Passport expiry"),
                personalRow(
                    label: "Driving l;icense no:",
                    controller: controller.drivingLicenseNo,
                    hinttext: "Driving l;icense no"),
                personalRow(
                    label: "Driving license expiry:",
                    controller: controller.drivingLicenseExp,
                    hinttext: "Driving license expiry"),
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Text(
                'Academic information',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ))
        ],
      ),
    );
  }

  presentAddressInfoSection(
      {required ProfileviewscreenController controller,
      required BuildContext context,
      required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.03),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                personalRow(
                    label: "Vill/House No/Area:",
                    controller: controller.presentVillage,
                    hinttext: "Village/Area"),
                personalRow(
                    label: "Police statios :",
                    controller: controller.presentPoliceStation,
                    hinttext: "Police statios "),
                personalRow(
                    label: "District:",
                    controller: controller.presentDistrict,
                    hinttext: "District"),
                personalRow(
                    label: "Division:",
                    controller: controller.presentDivision,
                    hinttext: "Division"),
                personalRow(
                    label: "Post office:",
                    controller: controller.presentPostOffice,
                    hinttext: "Post office"),
                personalRow(
                    label: "Post code:",
                    controller: controller.presentPostCode,
                    hinttext: "Post code"),
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Text(
                'Present address',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ))
        ],
      ),
    );
  }

  permanentAddressInfoSection(
      {required ProfileviewscreenController controller,
      required BuildContext context,
      required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.03),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                personalRow(
                    label: "Children 2 name :",
                    controller: controller.childTwoName,
                    hinttext: "Children 2 name"),
                personalRow(
                    label: "Children 2 date of birth :",
                    controller: controller.childTwoDob,
                    hinttext: "Children 2 date of birth"),
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Text(
                'Permanent address',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ))
        ],
      ),
    );
  }

  academicInfoSection(
      {required ProfileviewscreenController controller,
      required BuildContext context,
      required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.03),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                personalRow(
                    label: "Children 2 name :",
                    controller: controller.childTwoName,
                    hinttext: "Children 2 name"),
                personalRow(
                    label: "Children 2 date of birth :",
                    controller: controller.childTwoDob,
                    hinttext: "Children 2 date of birth"),
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Text(
                'Academic information',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ))
        ],
      ),
    );
  }

  personalRow(
      {required String label,
      required TextEditingController controller,
      required String hinttext}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black, width: 1),
      //     borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(flex: 1, child: textView(text: label)),
          SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 2,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: COMMONWIDGET.commonTextEdit(
                    hinttext: hinttext,
                    controller: controller,
                    obsecure: false,
                    enabled: true,
                    radius: 5,
                    borderColor: Colors.white),
              ))
        ],
      ),
    );
  }
}
