import 'dart:ui';

import 'package:attendance/app/data/globals/common_widgets.dart';
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
              child: Column(children: [
            personalInfo(controller: controller),
            SizedBox(
              height: 20,
            ),
            addressInfo(controller: controller),
            SizedBox(
              height: 20,
            ),
            academicInfo(controller: controller)
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

  personalInfo({required ProfileviewscreenController controller}) {
    return Container(
      width: double.infinity,
      height: 500,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.modernBlue,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: AppColors.modernBlue,
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
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                      dividerThickness: 1,
                      decoration: BoxDecoration(
                          // color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('Label'),
                        ),
                        DataColumn(
                          label: Text('Info'),
                        ),
                        DataColumn(
                          label: Text('Label'),
                        ),
                        DataColumn(
                          label: Text('Info'),
                        ),
                      ],
                      rows: [
                        tableRow(
                            label1: "Employee name:",
                            controller: controller.name,
                            lable2: "Employee Date of Birth:",
                            controller2: controller.dateOfBirth,
                            hinttext1: "Name",
                            hinttext2: "Date of birth"),
                        tableRow(
                            label1: "Father's name:",
                            controller: controller.fatherName,
                            lable2: "Father's profession:",
                            controller2: controller.fatherProf,
                            hinttext1: "Father's name",
                            hinttext2: "Father's profesion"),
                        tableRow(
                            label1: "Mother's name:",
                            controller: controller.motherName,
                            lable2: "Mother's profession:",
                            controller2: controller.motherProf,
                            hinttext1: "Mother's name",
                            hinttext2: "Mother's profession"),
                        tableRow(
                            label1: "Gender:",
                            controller: controller.gender,
                            lable2: "Blood Group:",
                            controller2: controller.bloodGroup,
                            hinttext1: "Gender",
                            hinttext2: "Blood Group"),
                        tableRow(
                            label1: "Nationality:",
                            controller: controller.nationality,
                            lable2: "National ID no:",
                            controller2: controller.nid,
                            hinttext1: "Nationality",
                            hinttext2: "NID"),
                        tableRow(
                            label1: "Height:",
                            controller: controller.height,
                            lable2: "Weight:",
                            controller2: controller.weight,
                            hinttext1: "Height",
                            hinttext2: "Weight"),
                        tableRow(
                            label1: "Religion: ",
                            controller: controller.religion,
                            lable2: "TIN no: ",
                            controller2: controller.tin,
                            hinttext1: "Religion",
                            hinttext2: "TIN no"),
                        tableRow(
                            label1: "Mobile (Personal): :",
                            controller: controller.phone,
                            lable2: "Email (Personal):",
                            controller2: controller.bloodGroup,
                            hinttext1: "Mobile (Personal): ",
                            hinttext2: "Email (Personal)"),
                        tableRow(
                            label1: "Marital status:",
                            controller: controller.maritalStatus,
                            lable2: "Spouse name:",
                            controller2: controller.spouseName,
                            hinttext1: "No of children",
                            hinttext2: "Spouse name"),
                        tableRow(
                            label1: "No of children:",
                            controller: controller.noOfChildren,
                            lable2: "Spouse date of birth:",
                            controller2: controller.spouseDob,
                            hinttext1: "Number of children",
                            hinttext2: "Spouse date of birth"),
                        tableRow(
                            label1: "Child 1 name:",
                            controller: controller.childOneName,
                            lable2: "Date of birth:",
                            controller2: controller.childOneDob,
                            hinttext1: "Child 1 name",
                            hinttext2: "Child 1 date of birth"),
                        tableRow(
                            label1: "Child 2 name:",
                            controller: controller.childTwoName,
                            lable2: "Child 2 date of birth:",
                            controller2: controller.childTwoDob,
                            hinttext1: "Child 2 name",
                            hinttext2: "Child 2 date of birth"),
                        tableRow(
                            label1: "Passport no:",
                            controller: controller.passportNo,
                            lable2: "Date of Expire:",
                            controller2: controller.passportExp,
                            hinttext1: "Passport number",
                            hinttext2: "Passport Expiry"),
                        tableRow(
                            label1: "Driving license no:",
                            controller: controller.drivingLicenseNo,
                            lable2: " Date of Expire:",
                            controller2: controller.drivingLicenseExp,
                            hinttext1: "License number",
                            hinttext2: "License Expiry")
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  addressInfo({required ProfileviewscreenController controller}) {
    return Container(
      width: double.infinity,
      height: 400,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.modernGreen),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: AppColors.modernGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Addresse',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                      dividerThickness: 1,
                      decoration: BoxDecoration(
                          // color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('Present address'),
                        ),
                        DataColumn(
                          label: Text('Info'),
                        ),
                        DataColumn(
                          label: Text('Permanent address'),
                        ),
                        DataColumn(
                          label: Text('Info'),
                        ),
                      ],
                      rows: [
                        tableRow(
                            label1: "Division:",
                            controller: controller.presentDivision,
                            lable2: "Division",
                            controller2: controller.permanentDivision,
                            hinttext1: "Present division",
                            hinttext2: "Permanent division"),
                        tableRow(
                            label1: "District:",
                            controller: controller.presentDistrict,
                            lable2: "District:",
                            controller2: controller.presentDistrict,
                            hinttext1: "Present district",
                            hinttext2: "Permanent district"),
                        tableRow(
                            label1: "Police Station:",
                            controller: controller.presentPoliceStation,
                            lable2: "Police Station:",
                            controller2: controller.permanentPoliceStation,
                            hinttext1: "Present Police Station",
                            hinttext2: "Permanent Police Station"),
                        tableRow(
                            label1: "Post Office:",
                            controller: controller.presentPostOffice,
                            lable2: "Post Office:",
                            controller2: controller.permanentPostOffice,
                            hinttext1: "Present post office",
                            hinttext2: "Permanent post office"),
                        tableRow(
                            label1: "Post Code:",
                            controller: controller.presentPostCode,
                            lable2: "Post Code:",
                            controller2: controller.permanentPostCode,
                            hinttext1: "Present Post Code",
                            hinttext2: "Permanent Post Code"),
                        tableRow(
                            label1: "Vill/House No/Area:",
                            controller: controller.presentVillage,
                            lable2: "Vill/House No/Area:",
                            controller2: controller.permanentVillage,
                            hinttext1: "Present Vill/House No/Area",
                            hinttext2: "Permanent Vill/House No/Area"),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  academicInfo({required ProfileviewscreenController controller}) {
    return Container(
      width: double.infinity,
      height: 300,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.modernCoral),
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
                    color: AppColors.modernCoral,
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
                  academicInfoAdd(controller: controller);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5, top: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: AppColors.modernCoral,
                      borderRadius: BorderRadius.circular(100)),
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Obx(() => DataTable(
                      dividerThickness: 1,
                      decoration: BoxDecoration(
                          // color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text('Exam name'),
                        ),
                        DataColumn(
                          label: Text('Group'),
                        ),
                        DataColumn(
                          label: Text('Board/University'),
                        ),
                        DataColumn(
                          label: Text('Institute name'),
                        ),
                        DataColumn(
                          label: Text('Division/Grade'),
                        ),
                        DataColumn(
                          label: Text('Passing year'),
                        ),
                        DataColumn(
                          label: Text('Result'),
                        ),
                        DataColumn(
                          label: Text('Out of'),
                        ),
                        DataColumn(
                          label: Text('Copy'),
                        ),
                      ],
                      rows: controller.academicControllers.isNotEmpty
                          ? controller.academicControllers
                              .map((element) {
                                return academicRow(element);
                              })
                              .toList()
                              .cast<DataRow>()
                          : [])),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  tableRow(
      {required String label1,
      required TextEditingController controller,
      required String lable2,
      required TextEditingController controller2,
      required String hinttext1,
      required String hinttext2,
      TextInputType? textInputType1,
      TextInputType? textInputType2}) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(label1)),
        DataCell(Container(
          height: 40,
          child: COMMONWIDGET.commonTextEdit(
              borderColor: Colors.transparent,
              radius: 5,
              hinttext: hinttext1,
              keyboardType: textInputType1 ?? TextInputType.text,
              controller: controller,
              obsecure: false),
        )),
        DataCell(Text(lable2)),
        DataCell(Container(
          height: 40,
          child: COMMONWIDGET.commonTextEdit(
              borderColor: Colors.transparent,
              radius: 5,
              keyboardType: textInputType2 ?? TextInputType.text,
              hinttext: hinttext2,
              controller: controller2,
              obsecure: false),
        )),
      ],
    );
  }

  academicRow(List<TextEditingController> controllers) {
    return DataRow(
      cells: <DataCell>[
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[0],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[1],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[2],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[3],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[4],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[5],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[6],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[7],
            obsecure: false,
            borderColor: Colors.transparent)),
        DataCell(COMMONWIDGET.commonTextEdit(
            hinttext: "",
            controller: controllers[8],
            obsecure: false,
            borderColor: Colors.transparent)),
      ],
    );
  }

  static academicInfoAdd({required ProfileviewscreenController controller}) {
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
                    height: 300,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Exam name ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "Exam name",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Group: ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "Group",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Board/University: ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "University/Board name",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Institute name:",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "Institute name",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Division/Grade ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "Division/Grade ",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Passing year ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "Passing year",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Result ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "result",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Out of",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "out of",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Copy ",
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
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.commonTextEdit(
                                        hinttext: "Select",
                                        controller: controller.name,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
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
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("Add",
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
}
