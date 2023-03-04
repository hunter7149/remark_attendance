import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
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
            // Container(
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.all(7),
            //   decoration: BoxDecoration(
            //       // borderRadius: BorderRadius.circular(100),
            //       // border: Border.all(width: 0.7, color: Colors.grey.shade600)
            //       ),
            //   child: Icon(
            //     FontAwesomeIcons.bell,
            //     color: Colors.grey.shade700,
            //     size: 20,
            //   ),
            // ),
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
            Container(
              width: double.maxFinite,
              // height: 400,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.modernGreen,
                // color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),

                // border: Border.all(width: 0.5, color: Colors.grey.shade400)
              ),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/logo/user.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.userProfile["personal"]["empName"],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "IT executive (Software)",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "IT Department",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Responsiblity",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Reporting to:Amit Kumar",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "01303146132",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "khalid.oalid@remarkhb.com",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          Get.toNamed(Routes.PROFILEVIEWSCREEN,
                              arguments: controller.userProfile);
                        },
                        onLongTap: () {
                          Get.toNamed(Routes.PROFILEEDITSCREEN,
                              arguments: controller.userProfile);
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors.modernCoral,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
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
              flex: 3,
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
                          color: Colors.blue,
                          valid: true,
                          title: "Attendance",
                          notification: false,
                          function: () {
                            Get.toNamed(Routes.ATTENDANCESCREEN);
                          }),
                      menuItem(
                          icon: FontAwesomeIcons.calendarDays,
                          color: Colors.deepOrange,
                          title: "Leaves",
                          valid: true,
                          notification: false,
                          function: () async {
                            Get.toNamed(Routes.LEAVESCREEN);
                          }),
                      menuItem(
                          icon: FontAwesomeIcons.tasks,
                          color: Colors.indigo,
                          notification: true,
                          title: "Tasks",
                          valid: true,
                          function: () async {
                            Get.toNamed(Routes.TASKSCREEN);
                          }),
                      // menuItem(
                      //     icon: Icons.payments,
                      //     color: Colors.green,
                      //     notification: false,
                      //     title: "Payments",
                      //     valid: true,
                      //     function: () async {
                      //       Get.toNamed(Routes.PAYMENTSCREEN);
                      //     }),
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ]),
        )));
  }

  static menuItem(
      {required IconData icon,
      required MaterialColor color,
      required String title,
      required VoidCallback function,
      required bool valid,
      required bool notification}) {
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
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Positioned(
                right: 10,
                top: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color:
                          notification ? Colors.pink.shade600 : color.shade100,
                      borderRadius: BorderRadius.circular(100)),
                ))
          ],
        ),
      ),
    );
  }
}
