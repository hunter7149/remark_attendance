import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personalinfo_controller.dart';

class PersonalinfoView extends GetView<PersonalinfoController> {
  const PersonalinfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            leadingIcon: Icons.man,
            tittle: "Personal information",
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
                    SizedBox(
                      height: 10,
                    ),
                    commonTextField(controller: controller.name, title: "Name"),
                    commonTextField(
                        controller: controller.dateOfBirth,
                        title: "Date of birth"),
                    commonTextField(
                        controller: controller.email, title: "Email"),
                    commonTextField(
                        controller: controller.phone, title: "Phone"),
                    commonTextField(
                        controller: controller.gender, title: "Gender"),
                    commonTextField(
                        controller: controller.bloodGroup,
                        title: "Blood group"),
                    commonTextField(
                        controller: controller.nationality,
                        title: "Nationality"),
                    commonTextField(
                        controller: controller.nid, title: "National identity"),
                    commonTextField(
                        controller: controller.height, title: "Height"),
                    commonTextField(
                        controller: controller.weight, title: "Weight")
                  ],
                ),
              )),
        ));
  }

  commonTextField(
      {required TextEditingController controller, required String title}) {
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: COMMONWIDGET.commonTextEdit(
                hinttext: "Name", controller: controller, obsecure: false),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
