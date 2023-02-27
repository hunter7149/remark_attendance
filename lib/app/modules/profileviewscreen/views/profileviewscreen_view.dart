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
              child: Column(
            children: [
              expandedPersonal(context: context),
              SizedBox(
                height: 20,
              ),
              expandedPresentAddress(context: context),
              SizedBox(
                height: 20,
              ),
              expandedPermanentAddress(context: context),
            ],
          )),
        )));
  }

  textView({required String text}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade100,
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

//-----------------------Section responsible for personal information-----------------------------//
  expandedPersonal({required BuildContext context}) {
    return ExpandablePanel(
      theme: ExpandableThemeData(
          tapBodyToCollapse: true,
          // hasIcon: false,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          // iconPlacement: ExpandablePanelIconPlacement.right,

          animationDuration: const Duration(milliseconds: 500),
          // tapBodyToExpand: true,
          expandIcon: Icons.arrow_circle_down,
          collapseIcon: Icons.arrow_circle_up),

      // ...

      header: Container(
        // height: 100,
        width: double.maxFinite,
        color: AppColors.modernBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.modernBlue,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  "assets/images/personal.png",
                  color: Colors.white,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Personal information",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      collapsed: Container(),

      expanded: Container(

          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                commonTextField(controller: controller.name, title: "Name"),
                commonTextField(
                    controller: controller.dateOfBirth, title: "Date of birth"),
                commonTextField(controller: controller.email, title: "Email"),
                commonTextField(controller: controller.phone, title: "Phone"),
                commonTextField(controller: controller.gender, title: "Gender"),
                commonTextField(
                    controller: controller.bloodGroup, title: "Blood group"),
                commonTextField(
                    controller: controller.nationality, title: "Nationality"),
                commonTextField(
                    controller: controller.nid, title: "National identity"),
                commonTextField(controller: controller.height, title: "Height"),
                commonTextField(controller: controller.weight, title: "Weight"),
                commonTextField(
                    controller: controller.religion, title: "Religion"),
                commonTextField(controller: controller.tin, title: "TIN no"),
                commonTextField(
                    controller: controller.maritalStatus,
                    title: "Marital status"),
                commonTextField(
                    controller: controller.spouseName, title: "Spouse name"),
                commonTextField(
                    controller: controller.spouseDob,
                    title: "Spouse date of birth"),
                commonTextField(
                    controller: controller.noOfChildren,
                    title: "No of children"),
                commonTextField(
                    controller: controller.childOneName,
                    title: "Children 1 name"),
                commonTextField(
                    controller: controller.childOneDob,
                    title: "Children 1 date of birth"),
                commonTextField(
                    controller: controller.childTwoName, title: "Child 2 name"),
                commonTextField(
                    controller: controller.childTwoDob,
                    title: "Child 2 date of birth"),
              ],
            ),
          )),
    );
  }

//-----------------------Section responsible for present address information-----------------------------//
  expandedPresentAddress({required BuildContext context}) {
    return ExpandablePanel(
      theme: ExpandableThemeData(
          tapBodyToCollapse: true,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          animationDuration: const Duration(milliseconds: 500),
          expandIcon: Icons.arrow_circle_down,
          collapseIcon: Icons.arrow_circle_up),
      header: Container(
        width: double.maxFinite,
        color: AppColors.modernGreen,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.modernGreen,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  "assets/images/contact.png",
                  color: Colors.white,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Present address",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      collapsed: Container(),
      expanded: Container(

          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                commonTextField(
                    controller: controller.presentVillage,
                    title: "Village/House no/Area"),
                commonTextField(
                    controller: controller.presentPoliceStation,
                    title: "Police station"),
                commonTextField(
                    controller: controller.presentPostOffice,
                    title: "Post office"),
                commonTextField(
                    controller: controller.presentDistrict, title: "District"),
                commonTextField(
                    controller: controller.presentDivision, title: "Division"),
                commonTextField(
                    controller: controller.presentPostCode, title: "Post code"),
              ],
            ),
          )),
    );
  }

//-----------------------Section responsible for permanent address information-----------------------------//
  expandedPermanentAddress({required BuildContext context}) {
    return ExpandablePanel(
      theme: ExpandableThemeData(
          tapBodyToCollapse: true,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          animationDuration: const Duration(milliseconds: 500),
          expandIcon: Icons.arrow_circle_down,
          collapseIcon: Icons.arrow_circle_up),
      header: Container(
        width: double.maxFinite,
        color: AppColors.modernSexyRed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.modernSexyRed,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  "assets/images/contact.png",
                  color: Colors.white,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Permanent address",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      collapsed: Container(),
      expanded: Container(

          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                commonTextField(
                    controller: controller.permanentVillage,
                    title: "Village/House no/Area"),
                commonTextField(
                    controller: controller.permanentPoliceStation,
                    title: "Police station"),
                commonTextField(
                    controller: controller.permanentPostOffice,
                    title: "Post office"),
                commonTextField(
                    controller: controller.permanentDistrict,
                    title: "District"),
                commonTextField(
                    controller: controller.permanentDivision,
                    title: "Division"),
                commonTextField(
                    controller: controller.permanentPostCode,
                    title: "Post code"),
              ],
            ),
          )),
    );
  }
}
