import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: Container(
          //   margin: EdgeInsets.all(10),
          //   padding: EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(100),
          //       border: Border.all(width: 0.7, color: Colors.grey.shade600)),
          //   child: Icon(
          //     FontAwesomeIcons.user,
          //     color: Colors.grey.shade700,
          //     size: 20,
          //   ),
          // ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            'Dashboard',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(100),
                  // border: Border.all(width: 0.7, color: Colors.grey.shade600)
                  ),
              child: Icon(
                FontAwesomeIcons.bell,
                color: Colors.grey.shade700,
                size: 20,
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            //-------------------Profile Section-----------------//
            Expanded(
              flex: 1,
              child: Container(
                width: double.maxFinite,
                // height: 400,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),

                  // border: Border.all(width: 0.5, color: Colors.grey.shade400)
                ),
                child: Column(children: [
                  Container(
                    child: Image.asset(
                      'assets/logo/user.png',
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mohammad Khalid Bin Oalid",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "IT executive (Software)",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //--------------Grey Divider----------------//
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   height: 1,
            //   width: double.maxFinite,
            //   color: Colors.grey.shade500,
            // ),

            //------------------Option Section--------------------//
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height / 1.5,
                  child: GridView.count(
                      //scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      childAspectRatio: (0.88),
                      shrinkWrap: true,
                      children: [
                        menuItem(
                            icon: FontAwesomeIcons.clock,
                            color: Colors.teal,
                            valid: true,
                            title: "Attendance",
                            function: () {
                              Get.toNamed(Routes.ATTENDANCESCREEN);
                            }),
                        menuItem(
                            icon: FontAwesomeIcons.calendarDays,
                            color: Colors.deepOrange,
                            title: "Leaves",
                            valid: true,
                            function: () async {
                              Get.toNamed(Routes.LEAVESCREEN);
                            }),
                      ]),
                ),
              ),
            )
          ]),
        )));
  }

  static menuItem(
      {required IconData icon,
      required MaterialColor color,
      required String title,
      required VoidCallback function,
      required bool valid}) {
    return ZoomTapAnimation(
      onTap: valid ? function : () {},
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
            color: valid ? color.shade100 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: valid ? color.shade200 : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.all(15),
              child: Icon(
                icon,
                size: 50,
                color: valid ? color.shade500 : Colors.grey.shade500,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: valid ? color.shade500 : Colors.grey.shade500,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
