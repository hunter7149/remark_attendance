import 'dart:ui';

import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:attendance/app/modules/profileviewscreen/components/text_controllers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
                  child: Obx(() => Column(
                        children: [
                          Container(
                            height: 220,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.8, color: AppColors.modernGreen)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          "https://media.licdn.com/dms/image/C5603AQHLw4e92r8-TA/profile-displayphoto-shrink_800_800/0/1637957304890?e=1683763200&v=beta&t=WeVtz_u61OB_NCTb9YwjFYonFvIHW8kjTXVTmsm9iG4",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset('assets/logo/user.png'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.modernGreen,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20))),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.edit),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          personalInfo(
                              controller: controller,
                              color: AppColors.modernGreen),
                          SizedBox(
                            height: 30,
                          ),
                          addressInfo(
                              controller: controller,
                              color: AppColors.modernBlue),
                          SizedBox(
                            height: 30,
                          ),
                          academicInfo(
                              controller: controller,
                              color: AppColors.modernCoolPink),
                          SizedBox(
                            height: 30,
                          ),
                          experienceInfo(
                              controller: controller,
                              color: AppColors.modernGreen),
                          SizedBox(
                            height: 30,
                          ),
                          contactPersonnel(
                              controller: controller,
                              color: AppColors.modernLightBrown),
                          SizedBox(
                            height: 30,
                          ),
                          trainingInfo(
                              controller: controller,
                              color: AppColors.modernPurple),
                          SizedBox(
                            height: 30,
                          ),
                          healthInfo(
                              controller: controller,
                              color: AppColors.modernChocolate),
                          SizedBox(
                            height: 30,
                          ),
                          languageInfo(
                              controller: controller,
                              color: AppColors.modernCoral),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )),
                ))));
  }

  textView(
      {required String text,
      Color? color,
      FontWeight? fontWeight,
      double? size}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.grey.shade900,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }

//-------------------------------Section for personal information----------------------//

  personalInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 500,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: color,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'Personal information',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        personalRow(
                            title: "Employee's Name",
                            value: controller.personalInformation['empName'],
                            color: color),
                        personalRow(
                            title: "Employee's date of birth",
                            value: controller.personalInformation['empDob'],
                            color: color),
                        personalRow(
                            title: "Father's name",
                            value: controller.personalInformation['empFather'],
                            color: color),
                        personalRow(
                            title: "Father's profession",
                            value:
                                controller.personalInformation['empFatherProf'],
                            color: color),
                        personalRow(
                            title: "Mother's name",
                            value: controller.personalInformation['empMother'],
                            color: color),
                        personalRow(
                            title: "Mother's profession",
                            value:
                                controller.personalInformation['empMotherProf'],
                            color: color),
                        personalRow(
                            title: "Gender",
                            value: controller.personalInformation['gender'],
                            color: color),
                        personalRow(
                            title: "Blood group",
                            value: controller.personalInformation['bloodGroup'],
                            color: color),
                        personalRow(
                            title: "Nationality",
                            value:
                                controller.personalInformation['nationality'],
                            color: color),
                        personalRow(
                            title: "National ID no",
                            value: controller.personalInformation['nid'],
                            color: color),
                        personalRow(
                            title: "Height",
                            value: controller.personalInformation['height'],
                            color: color),
                        personalRow(
                            title: "Weight",
                            value: controller.personalInformation['weight'],
                            color: color),
                        personalRow(
                            title: "Religion",
                            value: controller.personalInformation['religion'],
                            color: color),
                        personalRow(
                            title: "TIN no",
                            value: controller.personalInformation['tinNo'],
                            color: color),
                        personalRow(
                            title: "Mobile(Personal)",
                            value: controller.personalInformation['phone'],
                            color: color),
                        personalRow(
                            title: "Email(Personal)",
                            value: controller.personalInformation['email'],
                            color: color),
                        personalRow(
                            title: "Marital status",
                            value:
                                controller.personalInformation['maritalStatus'],
                            color: color),
                        personalRow(
                            title: "Spouse name",
                            value: controller.personalInformation['spouseName'],
                            color: color),
                        personalRow(
                            title: "No of children",
                            value:
                                controller.personalInformation['noOfChildren'],
                            color: color),
                        personalRow(
                            title: "Child 1 name",
                            value:
                                controller.personalInformation['children1name'],
                            color: color),
                        personalRow(
                            title: "Child 1 date of birth",
                            value:
                                controller.personalInformation['children1dob'],
                            color: color),
                        personalRow(
                            title: "Child 2 name",
                            value:
                                controller.personalInformation['children2name'],
                            color: color),
                        personalRow(
                            title: "Child 2 date of birth",
                            value:
                                controller.personalInformation['children2dob'],
                            color: color),
                        personalRow(
                            title: "Passport no",
                            value: controller.personalInformation['passport'],
                            color: color),
                        personalRow(
                            title: "Passport expiry date",
                            value:
                                controller.personalInformation['passportExp'],
                            color: color),
                        personalRow(
                            title: "Driving license no",
                            value: controller
                                .personalInformation['drivingLicense'],
                            color: color),
                        personalRow(
                            title: "Driving license expiry date",
                            value: controller
                                .personalInformation['drivingLicenseExp'],
                            color: color),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: ZoomTapAnimation(
              onTap: () {
                PERSONALCONTROLLERS con =
                    controller.personalEditingController();
                personalInfoUpdater(controller: controller, tcr: con);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5, top: 5),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                    textView(
                        text: "Edit",
                        color: Colors.white,
                        size: 12,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  personalRow(
      {required String title, required dynamic value, required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      // decoration: BoxDecoration(border: Border.all(width: 0.5, color: color)),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: textView(text: "${title}: ", color: Colors.grey.shade700)),
          Expanded(
              flex: 2,
              child: textView(text: "${value}", fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  static personalInfoUpdater(
      {required ProfileviewscreenController controller,
      required PERSONALCONTROLLERS tcr}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Employee name:",
                              hinttext: "Name",
                              controller: tcr.name),
                          inputFieldForPopup(
                              label: "Employee date of birth:",
                              hinttext: "Date of birth",
                              controller: tcr.dateOfBirth),
                          inputFieldForPopup(
                              label: "Father's name:",
                              hinttext: "Father's name",
                              controller: tcr.fatherName),
                          inputFieldForPopup(
                              label: "Father's Profession:",
                              hinttext: "Father's profession",
                              controller: tcr.fatherProf),
                          inputFieldForPopup(
                              label: "Mother's name:",
                              hinttext: "Mother's name",
                              controller: tcr.motherName),
                          inputFieldForPopup(
                              label: "Mother's profession:",
                              hinttext: "Mother's profession",
                              controller: tcr.motherProf),
                          inputFieldForPopup(
                              label: "Gender:",
                              hinttext: "Gender",
                              controller: tcr.gender),
                          inputFieldForPopup(
                              label: "Blood group:",
                              hinttext: "blood group",
                              controller: tcr.bloodGroup),
                          inputFieldForPopup(
                              label: "Nationality:",
                              hinttext: "Natioanlity",
                              controller: tcr.nationality),
                          inputFieldForPopup(
                              label: "National ID no:",
                              hinttext: "National ID number",
                              controller: tcr.nid),
                          inputFieldForPopup(
                              label: "Height:",
                              hinttext: "Height",
                              controller: tcr.height),
                          inputFieldForPopup(
                              label: "Weight:",
                              hinttext: "Weight",
                              controller: tcr.weight),
                          inputFieldForPopup(
                              label: "Religion:",
                              hinttext: "Religion",
                              controller: tcr.religion),
                          inputFieldForPopup(
                              label: "TIN no:",
                              hinttext: "Tax Identification Number",
                              controller: tcr.tin),
                          inputFieldForPopup(
                              label: "Mobile(Personal):",
                              hinttext: "Mobile",
                              controller: tcr.phone),
                          inputFieldForPopup(
                              label: "Email(Personal):",
                              hinttext: "Email(Personal)",
                              controller: tcr.email),
                          inputFieldForPopup(
                              label: "Marital status:",
                              hinttext: "Marital status:",
                              controller: tcr.maritalStatus),
                          inputFieldForPopup(
                              label: "Spouse name:",
                              hinttext: "Spouse name",
                              controller: tcr.spouseName),
                          inputFieldForPopup(
                              label: "No of children:",
                              hinttext: "No of children",
                              controller: tcr.noOfChildren),
                          inputFieldForPopup(
                              label: "Spouse date of birth:",
                              hinttext: "Dob",
                              controller: tcr.spouseDob),
                          inputFieldForPopup(
                              label: "Child 1 name:",
                              hinttext: "name",
                              controller: tcr.childOneName),
                          inputFieldForPopup(
                              label: "Child one date of birth:",
                              hinttext: "Child one date of birth",
                              controller: tcr.childOneDob),
                          inputFieldForPopup(
                              label: "Child 2 name:",
                              hinttext: "name",
                              controller: tcr.childTwoName),
                          inputFieldForPopup(
                              label: "Child two date of birth:",
                              hinttext: "Child one date of birth",
                              controller: tcr.childTwoDob),
                          inputFieldForPopup(
                              label: "Passport no:",
                              hinttext: "Passport number",
                              controller: tcr.passportNo),
                          inputFieldForPopup(
                              label: "Passport expiry date:",
                              hinttext: "date",
                              controller: tcr.passportExp),
                          inputFieldForPopup(
                              label: "Driving license no:",
                              hinttext: "Driving license number",
                              controller: tcr.drivingLicenseNo),
                          inputFieldForPopup(
                              label: "Driving license expiry date",
                              hinttext: "date",
                              controller: tcr.drivingLicenseExp),
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            controller.singlePersonalInfoUpdater(
                                controller: tcr);
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("Save",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  static inputFieldForPopup(
      {required String label,
      required String hinttext,
      required TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.w600),
              // textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10)),
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: hinttext,
                  border: InputBorder.none,
                ),
              ),
              // COMMONWIDGET.commonTextEdit(
              //     hinttext: hinttext,
              //     controller: controller,
              //     obsecure: false,
              //     maxline: 1)
            ),
          ),
        ],
      ),
    );
  }

  personalRowView({
    required String label1,
    required String data1,
    required String lable2,
    required String data2,
  }) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(label1)),
        DataCell(Text(
          data1,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        DataCell(Text(lable2)),
        DataCell(Text(
          data2,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

//------------------------------------------------------------------------------------//
//----------------------------Address Information------------------------------------//
  addressInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 400,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(20))),
                      child: Center(
                        child: Text(
                          'Address',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            singleAddressItem(
                                data: controller.addressInfo['present'],
                                color: AppColors.modernGreen,
                                title: "Present address"),
                            singleAddressItem(
                                data: controller.addressInfo['permanent'],
                                color: AppColors.modernBlue,
                                title: "Permanent address")
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: ZoomTapAnimation(
              onTap: () {
                ADDRESSCONTROLLERS present =
                    controller.presentAddressEditingController();
                ADDRESSCONTROLLERS permanent =
                    controller.permanentAddressEditingController();
                addressInfoUpdater(
                    controller: controller,
                    present: present,
                    permanent: permanent,
                    color: color);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5, top: 5),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                    textView(
                        text: "Edit",
                        color: Colors.white,
                        size: 12,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  singleAddressItem(
      {required Map<String, dynamic> data,
      required Color color,
      required String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: color,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // height: 30,
                width: 130,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: color, width: 0.5),
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(10))),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              personalRow(
                  title: "Division", value: data['division'], color: color),
              personalRow(
                  title: "District", value: data['district'], color: color),
              personalRow(
                  title: "Police station",
                  value: data['policeStation'],
                  color: color),
              personalRow(
                  title: "Post office",
                  value: data['postOffice'],
                  color: color),
              personalRow(
                  title: "Post code", value: data['postCode'], color: color),
              personalRow(
                  title: "Village/House No/Area",
                  value: data['village'],
                  color: color),
            ],
          )
        ],
      ),
    );
  }

  static addressInfoUpdater(
      {required ProfileviewscreenController controller,
      required ADDRESSCONTROLLERS present,
      required ADDRESSCONTROLLERS permanent,
      required Color color}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.8, color: color),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // height: 40,
                                      // width: 180,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: color,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      child: Center(
                                        child: Text(
                                          'Present',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    children: [
                                      inputFieldForPopup(
                                          label: "Vill/House no/Area:",
                                          hinttext: "Vill/House no/Area",
                                          controller: present.village),
                                      inputFieldForPopup(
                                          label: "Police station:",
                                          hinttext: "Police station",
                                          controller: present.policeStation),
                                      inputFieldForPopup(
                                          label: "Post office:",
                                          hinttext: "Post office",
                                          controller: present.postOffice),
                                      inputFieldForPopup(
                                          label: "Post code",
                                          hinttext: "Post code",
                                          controller: present.postCode),
                                      inputFieldForPopup(
                                          label: "District",
                                          hinttext: "District",
                                          controller: present.district),
                                      inputFieldForPopup(
                                          label: "Division",
                                          hinttext: "Division",
                                          controller: present.division),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.8, color: color),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // height: 40,
                                      // width: 180,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: color,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      child: Center(
                                        child: Text(
                                          'Permanent',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    children: [
                                      inputFieldForPopup(
                                          label: "Vill/House no/Area:",
                                          hinttext: "Vill/House no/Area",
                                          controller: permanent.village),
                                      inputFieldForPopup(
                                          label: "Police station:",
                                          hinttext: "Police station",
                                          controller: permanent.policeStation),
                                      inputFieldForPopup(
                                          label: "Post office:",
                                          hinttext: "Post office",
                                          controller: permanent.postOffice),
                                      inputFieldForPopup(
                                          label: "Post code",
                                          hinttext: "Post code",
                                          controller: permanent.postCode),
                                      inputFieldForPopup(
                                          label: "District",
                                          hinttext: "District",
                                          controller: permanent.district),
                                      inputFieldForPopup(
                                          label: "Division",
                                          hinttext: "Division",
                                          controller: permanent.division),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            controller.singleAddressInfoUpdate(
                                present: present, permanent: permanent);
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("Save",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
//-----------------------------------------------------------------------------------//

//---------------------------------Academic Info-------------------------------------//

  academicInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 300,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Academic information',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  ACADEMICCONTROLLERS tcr = ACADEMICCONTROLLERS();
                  singleAcademicInfoUpdate(
                      controller: controller, tcr: tcr, type: 1, index: 0);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: controller.academicData.isNotEmpty
                        ? Column(
                            children: controller.academicData.isNotEmpty
                                ? List.generate(controller.academicData.length,
                                    (index) {
                                    return academicRow(
                                        index, controller.academicData[index]);
                                  }).toList().cast<Widget>()
                                : [])
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                child: Image.asset(
                                  "assets/images/empty.png",
                                  fit: BoxFit.cover,
                                  color: color,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "No data provided!",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          )),
              ),
            ),
          )
        ],
      ),
    );
  }

  academicRow(
    int index,
    Map<String, dynamic> e,
  ) {
    Color color = AppColors.modernBlue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          child: Center(
            child: Text(
              "${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        personalRow(title: "Exam name", value: e['examName'], color: color),
        personalRow(title: "Group", value: e['group'], color: color),
        personalRow(title: "Board/University", value: e['board'], color: color),
        personalRow(
            title: "Institute name", value: e['institute'], color: color),
        personalRow(
            title: "Division/Grade", value: e['division'], color: color),
        personalRow(
            title: "Passing year", value: e['passingYear'], color: color),
        personalRow(title: "Result", value: e['result'], color: color),
        personalRow(title: "Out of", value: e['scale'], color: color),
        personalRow(title: "Copy", value: e['copy'], color: color),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ZoomTapAnimation(
              onTap: () {
                ACADEMICCONTROLLERS tcr = controller
                    .academicInformationEditingController(index: index);
                singleAcademicInfoUpdate(
                    controller: controller, tcr: tcr, type: 0, index: index);
              },
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30))),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textView(text: "Edit", size: 12, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  static singleAcademicInfoUpdate(
      {required ProfileviewscreenController controller,
      required ACADEMICCONTROLLERS tcr,
      required int type,
      required int index}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Exam name:",
                              hinttext: "Exam name",
                              controller: tcr.examName),
                          inputFieldForPopup(
                              label: "Group:",
                              hinttext: "Group",
                              controller: tcr.group),
                          inputFieldForPopup(
                              label: "Board/University:",
                              hinttext: "Board/University",
                              controller: tcr.board),
                          inputFieldForPopup(
                              label: "Institute name:",
                              hinttext: "Institute name",
                              controller: tcr.institute),
                          inputFieldForPopup(
                              label: "Division/Grade:",
                              hinttext: "Division/Grade",
                              controller: tcr.division),
                          inputFieldForPopup(
                              label: "Passing year:",
                              hinttext: "Passing year",
                              controller: tcr.passingYear),
                          inputFieldForPopup(
                              label: "Result:",
                              hinttext: "Result",
                              controller: tcr.result),
                          inputFieldForPopup(
                              label: "Out of:",
                              hinttext: "Out of",
                              controller: tcr.outOf),
                          inputFieldForPopup(
                              label: "Copy:",
                              hinttext: "Copy",
                              controller: tcr.copy),
                          type == 0
                              ? deleteItem(function: () {
                                  Get.back();
                                  controller.singleAcademicDataRemove(
                                      index: index);
                                })
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (type == 0) {
                              controller.singelAcademicDataUpdate(
                                  txtcnt: tcr, index: index);
                            } else {
                              controller.singelAcademicDataAdd(txtcnt: tcr);
                            }
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: type == 0
                                ? Text("Save",
                                    style: TextStyle(color: Colors.white))
                                : Text("Add",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

//---------------------------------Experience Information----------------------------//
  experienceInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 300,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Experience information',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  EXPERIENCECONTROLLERS tcr = EXPERIENCECONTROLLERS();
                  singleExperienceInfoUpdate(
                      controller: controller, tcr: tcr, type: 1, index: 0);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: controller.experienceData.isNotEmpty
                        ? List.generate(controller.experienceData.length,
                            (index) {
                            return experienceRow(
                                index, controller.experienceData[index]);
                          }).toList().cast<Widget>()
                        : [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/empty.png",
                                    fit: BoxFit.cover,
                                    color: color,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No data provided!",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            )
                          ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  experienceRow(
    int index,
    Map<String, dynamic> e,
  ) {
    Color color = AppColors.modernBlue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          child: Center(
            child: Text(
              "${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        personalRow(
            title: "Organization", value: e['organization'], color: color),
        personalRow(title: "Department", value: e['department'], color: color),
        personalRow(title: "Job title", value: e['jobTitle'], color: color),
        personalRow(title: "Start Date", value: e['startDate'], color: color),
        personalRow(title: "End Date", value: e['endDate'], color: color),
        personalRow(title: "Tenture", value: e['tenure'], color: color),
        personalRow(
            title: "Reason of leaving", value: e['reason'], color: color),
        personalRow(title: "Out of", value: e['responsibility'], color: color),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ZoomTapAnimation(
              onTap: () {
                EXPERIENCECONTROLLERS tcr = controller
                    .experienceInformationEditingController(index: index);
                singleExperienceInfoUpdate(
                    controller: controller, tcr: tcr, type: 0, index: index);
              },
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30))),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textView(text: "Edit", size: 12, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  static singleExperienceInfoUpdate(
      {required ProfileviewscreenController controller,
      required EXPERIENCECONTROLLERS tcr,
      required int type,
      required int index}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Organization:",
                              hinttext: "Organization",
                              controller: tcr.organization),
                          inputFieldForPopup(
                              label: "Department:",
                              hinttext: "Department",
                              controller: tcr.department),
                          inputFieldForPopup(
                              label: "Job title:",
                              hinttext: "Job title",
                              controller: tcr.jobTitle),
                          inputFieldForPopup(
                              label: "Start Date:",
                              hinttext: "Start Date",
                              controller: tcr.startDate),
                          inputFieldForPopup(
                              label: "End date:",
                              hinttext: "End date",
                              controller: tcr.endDate),
                          inputFieldForPopup(
                              label: "Tenture:",
                              hinttext: "Tenture",
                              controller: tcr.tenure),
                          inputFieldForPopup(
                              label: "Reason of leaving:",
                              hinttext: "Reason of leaving",
                              controller: tcr.reason),
                          inputFieldForPopup(
                              label: "Responsibility:",
                              hinttext: "Responsibility",
                              controller: tcr.responsibility),
                          type == 0
                              ? deleteItem(function: () {
                                  controller.singleExperienceDataRemove(
                                      index: index);
                                  Get.back();
                                })
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (type == 0) {
                              controller.singelExperienceDataUpdate(
                                  txtcnt: tcr, index: index);
                            } else {
                              controller.singelExperienceDataAdd(txtcnt: tcr);
                            }
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: type == 0
                                ? Text("Save",
                                    style: TextStyle(color: Colors.white))
                                : Text("Add",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

//-------------------------------Contact Personnel---------------------------------//
  contactPersonnel(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
        width: double.infinity,
        height: 300,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: color),
            borderRadius: BorderRadius.circular(10)),
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'Contact personnel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: controller.contactPersonnel.isNotEmpty
                            ? [
                                contactPersonnelRow(
                                  "Emergency",
                                  "emergency",
                                  controller.contactPersonnel['emergency'],
                                ),
                                contactPersonnelRow("Reference", 'reference',
                                    controller.contactPersonnel['reference']),
                                contactPersonnelRow("Nominee", 'reference',
                                    controller.contactPersonnel['nominee']),
                                contactPersonnelRow("Guarantor", 'reference',
                                    controller.contactPersonnel['guarantor'])
                              ]
                            : [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      height: 50,
                                      child: Image.asset(
                                        "assets/images/empty.png",
                                        fit: BoxFit.cover,
                                        color: color,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "No data provided!",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )
                              ]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  contactPersonnelRow(
    String title,
    String jsonTitle,
    Map<String, dynamic> e,
  ) {
    Color color = AppColors.modernBlue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          child: Center(
            child: Text(
              "${title}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        personalRow(title: "Contact name", value: e['name'], color: color),
        personalRow(
            title: "Orgranization", value: e['organization'], color: color),
        personalRow(title: "Contact no", value: e['contactNo'], color: color),
        personalRow(title: "Email address", value: e['email'], color: color),
        personalRow(title: "Address", value: e['address'], color: color),
        personalRow(title: "NID no", value: e['nid'], color: color),
        personalRow(title: "Relation", value: e['relation'], color: color),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ZoomTapAnimation(
              onTap: () {
                CONTACTPERSONNELCONTROLLERS tcr = controller
                    .contactPersonnelEditingController(title: jsonTitle);
                singleContactPersonnelInfoUpdate(
                    controller: controller,
                    tcr: tcr,
                    type: 0,
                    jsonTitle: jsonTitle);
              },
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30))),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textView(text: "Edit", size: 12, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  static singleContactPersonnelInfoUpdate(
      {required ProfileviewscreenController controller,
      required CONTACTPERSONNELCONTROLLERS tcr,
      required int type,
      required String jsonTitle}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Contact name:",
                              hinttext: "name",
                              controller: tcr.contactName),
                          inputFieldForPopup(
                              label: "Organization:",
                              hinttext: "Organization",
                              controller: tcr.organization),
                          inputFieldForPopup(
                              label: "Contact no:",
                              hinttext: "Contact no",
                              controller: tcr.contactNo),
                          inputFieldForPopup(
                              label: "Email address:",
                              hinttext: "Email address",
                              controller: tcr.emailAddress),
                          inputFieldForPopup(
                              label: "Address:",
                              hinttext: "Address",
                              controller: tcr.address),
                          inputFieldForPopup(
                              label: "NID no:",
                              hinttext: "NID no",
                              controller: tcr.nidNo),
                          inputFieldForPopup(
                              label: "Relation:",
                              hinttext: "Relation",
                              controller: tcr.relation),
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (type == 0) {
                              controller.singelContactPersonnelDataUpdate(
                                  txtcnt: tcr, jsonTitle: jsonTitle);
                              // controller.singelExperienceDataUpdate(
                              //     txtcnt: tcr, index: index);
                            } else {
                              // controller.singelExperienceDataAdd(txtcnt: tcr);
                            }
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: type == 0
                                ? Text("Save",
                                    style: TextStyle(color: Colors.white))
                                : Text("Add",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

//-------------------------------Training Data-------------------------------------//

  trainingInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 300,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Training information',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  TRAININGINFORMATIONCONTROLLERS tcr =
                      TRAININGINFORMATIONCONTROLLERS();
                  singleTrainingInfoUpdate(
                      controller: controller, tcr: tcr, type: 1, index: 0);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: controller.trainningData.isNotEmpty
                        ? List.generate(controller.trainningData.length,
                            (index) {
                            return trainingRow(
                                index, controller.trainningData[index]);
                          }).toList().cast<Widget>()
                        : [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/empty.png",
                                    fit: BoxFit.cover,
                                    color: color,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No data provided!",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            )
                          ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  trainingRow(
    int index,
    Map<String, dynamic> e,
  ) {
    Color color = AppColors.modernBlue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          child: Center(
            child: Text(
              "${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        personalRow(title: "Trainign name", value: e['name'], color: color),
        personalRow(title: "Department", value: e['type'], color: color),
        personalRow(title: "Job title", value: e['institute'], color: color),
        personalRow(title: "Start Date", value: e['startDate'], color: color),
        personalRow(title: "End Date", value: e['endDate'], color: color),
        personalRow(title: "Tenture", value: e['duration'], color: color),
        personalRow(title: "Reason of leaving", value: e['copy'], color: color),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ZoomTapAnimation(
              onTap: () {
                TRAININGINFORMATIONCONTROLLERS tcr =
                    controller.trainingEditingController(index: index);
                singleTrainingInfoUpdate(
                    controller: controller, tcr: tcr, type: 0, index: index);
              },
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30))),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textView(text: "Edit", size: 12, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  static singleTrainingInfoUpdate(
      {required ProfileviewscreenController controller,
      required TRAININGINFORMATIONCONTROLLERS tcr,
      required int type,
      required int index}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Training Name:",
                              hinttext: "Training Name",
                              controller: tcr.trainingName),
                          inputFieldForPopup(
                              label: "Training type:",
                              hinttext: "Training type",
                              controller: tcr.trainingType),
                          inputFieldForPopup(
                              label: "Institute name:",
                              hinttext: "Institute name",
                              controller: tcr.instituteName),
                          inputFieldForPopup(
                              label: "Start Date:",
                              hinttext: "Start Date",
                              controller: tcr.startDate),
                          inputFieldForPopup(
                              label: "End date:",
                              hinttext: "End date",
                              controller: tcr.endDate),
                          inputFieldForPopup(
                              label: "Duration:",
                              hinttext: "Duration",
                              controller: tcr.duration),
                          inputFieldForPopup(
                              label: "Copy:",
                              hinttext: "Copy",
                              controller: tcr.copy),
                          type == 0
                              ? deleteItem(function: () {
                                  controller.singleTrainingDataRemove(
                                      index: index);
                                  Get.back();
                                })
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (type == 0) {
                              controller.singelTrainingDataUpdate(
                                  txtcnt: tcr, index: index);
                            } else {
                              controller.singelTrainingDataAdd(txtcnt: tcr);
                            }
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: type == 0
                                ? Text("Save",
                                    style: TextStyle(color: Colors.white))
                                : Text("Add",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

//---------------------------------------------------------------------------------//

//------------------------------Health data---------------------------------------//

  healthInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 300,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Health information',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  HEALTHINFORMATIONCONTROLLERS tcr =
                      HEALTHINFORMATIONCONTROLLERS();
                  singleHealthInfoUpdate(
                      controller: controller, tcr: tcr, type: 1, index: 0);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: controller.healthData.isNotEmpty
                        ? List.generate(controller.healthData.length, (index) {
                            return healthRow(
                                index, controller.healthData[index]);
                          }).toList().cast<Widget>()
                        : [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/empty.png",
                                    fit: BoxFit.cover,
                                    color: color,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No data provided!",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            )
                          ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  healthRow(
    int index,
    Map<String, dynamic> e,
  ) {
    Color color = AppColors.modernBlue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          child: Center(
            child: Text(
              "${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        personalRow(
            title: "Health issue type", value: e['issueType'], color: color),
        personalRow(
            title: "Medication/Description",
            value: e['description'],
            color: color),
        personalRow(
            title: "Report/Prescription",
            value: e['prescriptiom'],
            color: color),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ZoomTapAnimation(
              onTap: () {
                HEALTHINFORMATIONCONTROLLERS tcr =
                    controller.healthEditingController(index: index);
                singleHealthInfoUpdate(
                    controller: controller, tcr: tcr, type: 0, index: index);
              },
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30))),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textView(text: "Edit", size: 12, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  static singleHealthInfoUpdate(
      {required ProfileviewscreenController controller,
      required HEALTHINFORMATIONCONTROLLERS tcr,
      required int type,
      required int index}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Health issue type:",
                              hinttext: "Health issue type",
                              controller: tcr.healthIssueType),
                          inputFieldForPopup(
                              label: "Medication/Description:",
                              hinttext: "Medication/Description",
                              controller: tcr.medication),
                          inputFieldForPopup(
                              label: "Report/Prescription:",
                              hinttext: "Report/Prescription",
                              controller: tcr.report),
                          type == 0
                              ? deleteItem(function: () {
                                  controller.singleHealthDataRemove(
                                      index: index);
                                  Get.back();
                                })
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (type == 0) {
                              controller.singelHealthDataUpdate(
                                  txtcnt: tcr, index: index);
                            } else {
                              controller.singelHealthDataAdd(txtcnt: tcr);
                            }
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: type == 0
                                ? Text("Save",
                                    style: TextStyle(color: Colors.white))
                                : Text("Add",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

//-------------------------------------------------------------------------------//

//----------------------------Language data-------------------------------------//
  languageInfo(
      {required ProfileviewscreenController controller, required Color color}) {
    return Container(
      width: double.infinity,
      height: 300,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Language information',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  LANGUAGECONTROLLERS tcr = LANGUAGECONTROLLERS();
                  singleLanguageInfoUpdate(
                      controller: controller, tcr: tcr, type: 1, index: 0);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: controller.languageData.isNotEmpty
                        ? List.generate(controller.languageData.length,
                            (index) {
                            return languageRow(
                                index, controller.languageData[index]);
                          }).toList().cast<Widget>()
                        : [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/empty.png",
                                    fit: BoxFit.cover,
                                    color: color,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No data provided!",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            )
                          ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  languageRow(
    int index,
    Map<String, dynamic> e,
  ) {
    Color color = AppColors.modernBlue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          child: Center(
            child: Text(
              "${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        personalRow(title: "Language name", value: e['name'], color: color),
        personalRow(title: "Speaking", value: e['speaking'], color: color),
        personalRow(title: "Reading", value: e['reading'], color: color),
        personalRow(title: "Writting", value: e['writing'], color: color),
        personalRow(
            title: "Understanding", value: e['understanding'], color: color),
        personalRow(title: "Remarks", value: e['remarks'], color: color),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ZoomTapAnimation(
              onTap: () {
                LANGUAGECONTROLLERS tcr =
                    controller.languageEditingController(index: index);
                singleLanguageInfoUpdate(
                    controller: controller, tcr: tcr, type: 0, index: index);
              },
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(30))),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textView(text: "Edit", size: 12, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  static singleLanguageInfoUpdate(
      {required ProfileviewscreenController controller,
      required LANGUAGECONTROLLERS tcr,
      required int type,
      required int index}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter your information",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: Colors.red.shade800,
                            size: 20,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    height: 400,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputFieldForPopup(
                              label: "Language name:",
                              hinttext: "Language name",
                              controller: tcr.languageName),
                          inputFieldForPopup(
                              label: "Speaking:",
                              hinttext: "Speaking",
                              controller: tcr.speaking),
                          inputFieldForPopup(
                              label: "Reading:",
                              hinttext: "Reading",
                              controller: tcr.reading),
                          inputFieldForPopup(
                              label: "Writing:",
                              hinttext: "Writing",
                              controller: tcr.writing),
                          inputFieldForPopup(
                              label: "Understanding:",
                              hinttext: "Understanding",
                              controller: tcr.understanding),
                          inputFieldForPopup(
                              label: "Remarks:",
                              hinttext: "Remarks",
                              controller: tcr.remarks),
                          type == 0
                              ? deleteItem(function: () {
                                  controller.singleLanguageDataRemove(
                                      index: index);
                                  Get.back();
                                })
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (type == 0) {
                              controller.singelLanguageDataUpdate(
                                  txtcnt: tcr, index: index);
                            } else {
                              controller.singelLanguageDataAdd(txtcnt: tcr);
                            }
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: type == 0
                                ? Text("Save",
                                    style: TextStyle(color: Colors.white))
                                : Text("Add",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

//------------------------------------------------------------------------------//

//--------------Function to delete------------------------------//
  static deleteItem({required VoidCallback function}) {
    return ZoomTapAnimation(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: AppColors.modernSexyRed,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Delete this item",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
