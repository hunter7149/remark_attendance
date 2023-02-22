import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/management_controller.dart';

class ManagementView extends GetView<ManagementController> {
  const ManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: COMMONWIDGET.globalAppBar(
          tittle: "Attendance management",
          backFunction: () {
            Get.back();
          }),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuItem(
                  menuTitle: "Check In/Out",
                  imageLink: "assets/images/attendance.png",
                  color: Colors.green,
                  function: () {
                    Get.toNamed(Routes.ATTENDANCESCREEN);
                  }),
              menuItem(
                  menuTitle: "Leave Management",
                  imageLink: "assets/images/leave.png",
                  color: Colors.deepOrange,
                  function: () {
                    Get.toNamed(Routes.LEAVESCREEN);
                  }),
              menuItem(
                  menuTitle: "Movement Management",
                  imageLink: "assets/images/movement.png",
                  color: Colors.teal,
                  function: () {
                    Get.toNamed(Routes.MOVEMENTSCREEN);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  static menuItem(
      {required String menuTitle,
      required String imageLink,
      required MaterialColor color,
      required VoidCallback function}) {
    return ZoomTapAnimation(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color.shade400,
              ),
              child: Image.asset(
                imageLink,
                color: Colors.white,
                // color: color.shade900,
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                // width: 80,
                decoration: BoxDecoration(
                    color: color.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Center(
                  child: Text(
                    menuTitle,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
