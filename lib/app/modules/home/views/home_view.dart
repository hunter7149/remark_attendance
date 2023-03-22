import 'dart:ui';

import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          backgroundColor: AppColors.modernBlue,
          // title: Text(
          //   'Dashboard',
          //   style: TextStyle(color: Colors.grey.shade100),
          // ),
          centerTitle: true,
          actions: [
            ZoomTapAnimation(
              onTap: () {
                signOutAlert(controller: controller);
              },
              child: Row(
                children: [
                  Text(
                    "Sign out",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColors.modernSexyRed,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 0.7,
                          color: AppColors.modernSexyRed,
                        )),
                    child: Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            // SizedBox(
            //   height: 20,
            // ),
            //-------------------Profile Section-----------------//
            Obx(
              () => controller.userProfile.isEmpty
                  ? Container()
                  : Container(
                      width: double.maxFinite,
                      // height: 400,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.modernBlue,
                        // color: Colors.grey.shade100,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),

                        // border: Border.all(width: 0.5, color: Colors.grey.shade400)
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          "https://media.licdn.com/dms/asasimage/C5603AQHLw4e92r8-TA/profile-displayphoto-shrink_800_800/0/1637957304890?e=1683763200&v=beta&t=WeVtz_u61OB_NCTb9YwjFYonFvIHW8kjTXVTmsm9iG4",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/logo/user.png',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${controller.userProfile["name"]}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${controller.userProfile["designation"]}", //des
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${controller.userProfile["department"]}", //dept
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Responsibility: ${controller.userProfile["responsibility"] ?? "N/A"}", //respons
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Reporting to: ${controller.userProfile["rboss"] ?? "NO DATA"}", //report
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${controller.userProfile["mobile"]}", //phone
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${controller.userProfile["email"]}", //email
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
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
                                      arguments: controller.userInfo);
                                },
                                onLongTap: () {
                                  Get.toNamed(Routes.PROFILEEDITSCREEN,
                                      arguments: controller.userInfo);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppColors.modernRed,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          topLeft: Radius.circular(50))),
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
                padding: EdgeInsets.symmetric(horizontal: 16),
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

  static signOutAlert({
    required HomeController controller,
  }) {
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
                        "Confirmation",
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
                      // height: 300,
                      width: double.maxFinite,
                      child: Text("Are you sure you want to sign out?",
                          style: TextStyle(color: Colors.black))),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: ZoomTapAnimation(
                          onTap: () {
                            controller.requestSignOut();
                          },
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.modernGreen,
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text("SIGN OUT",
                                  style: TextStyle(color: Colors.white))),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
