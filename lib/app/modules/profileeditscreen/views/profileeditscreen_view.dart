import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profileeditscreen_controller.dart';

class ProfileeditscreenView extends GetView<ProfileeditscreenController> {
  const ProfileeditscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: COMMONWIDGET.globalAppBar(
          tittle: "My account",
          backFunction: () {
            Get.back();
          }),
      body: Container(
        // height: MediaQuery.of(context).size.height / 1.5,
        child: GridView.count(

            //scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            childAspectRatio: (0.91),
            shrinkWrap: true,
            children: [
              menuItem(
                  imageLink: "assets/images/personal.png",
                  color: AppColors.modernBlue,
                  title: "Personal information",
                  function: () {
                    Get.toNamed(Routes.PERSONALINFO,
                        arguments: controller.userProfile);
                  }),
              menuItem(
                  imageLink: "assets/images/family.png",
                  color: AppColors.modernGreen,
                  title: "Family information",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
              menuItem(
                  imageLink: "assets/images/education.png",
                  color: AppColors.modernPlantation,
                  title: "Academical information",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
              menuItem(
                  imageLink: "assets/images/contact.png",
                  color: Colors.deepOrangeAccent,
                  title: "Address information",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
              menuItem(
                  imageLink: "assets/images/experience.png",
                  color: AppColors.modernSexyRed,
                  title: "Previous experience",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
              menuItem(
                  imageLink: "assets/images/phone.png",
                  color: AppColors.modernPurple,
                  title: "Contact personnel",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
              menuItem(
                  imageLink: "assets/images/training.png",
                  color: Colors.teal,
                  title: "Training information",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
              menuItem(
                  imageLink: "assets/images/education.png",
                  color: AppColors.modernChocolate,
                  title: "Health information",
                  function: () async {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
            ]),
      ),
    );
  }

  static menuItem({
    required String imageLink,
    required Color color,
    required String title,
    required VoidCallback function,
  }) {
    return ZoomTapAnimation(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        // EdgeInsets.only(
        //                             left: index % 2 == 0
        //                                 ? 8
        //                                 : 0,
        //                             right: index % 2 != 0
        //                                 ? 8
        //                                 : 0),
        decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      imageLink,
                      color: Colors.white,
                      height: 50,
                      width: 50,
                      // color: color.shade900,
                    ),
                    // Icon(
                    //   icon,
                    //   size: 50,
                    //   color: valid ? color.shade500 : Colors.grey.shade500,
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
