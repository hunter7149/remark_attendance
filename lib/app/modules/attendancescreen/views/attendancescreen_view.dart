import 'dart:ui';

import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/attendancescreen_controller.dart';

class AttendancescreenView extends GetView<AttendancescreenController> {
  const AttendancescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            leadingIcon: Icons.arrow_back,
            tittle: "Attendance Management",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                //------------------Attendance status-----------------//
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: AppColors.modernPlantation,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Attendance status",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Obx(() => Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                                color: controller.isCheckedIn.value
                                    ? Colors.green.shade400
                                    : Colors.red.shade400,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                              child: Text(
                                controller.isCheckedIn.value
                                    ? "Checked in"
                                    : "Not checked in",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 5),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: AppColors.modernPlantation,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "In",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Out",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Status",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          //------Dynamic items------//
                          controller.isAttendanceLoading.value
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Column(
                                    children: [
                                      SpinKitRipple(
                                        color: AppColors.modernGreen,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Fetching data...")
                                    ],
                                  )),
                                )
                              : Column(
                                  children: controller
                                          .attendanceHistory.isNotEmpty
                                      ? controller.attendanceHistory
                                          .map((element) => Container(
                                                // margin:
                                                //     EdgeInsets.symmetric(vertical: 5),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.grey.shade200),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "  ${element["ATTN_DATE"]}",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${element["IN_TIME"]}",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${element["OUT_TIME"]}",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${element["ATTN_DAY_STS_TYPE"]}",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                "${element["ATTN_DAY_STS_TYPE"]}" ==
                                                                        "LATE"
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .grey
                                                                        .shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList()
                                      : [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 50,
                                                child: Image.asset(
                                                  "assets/images/empty.png",
                                                  fit: BoxFit.cover,
                                                  color: AppColors.modernGreen,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "No attendance history!",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )
                                        ]),
                          //---Buttom curve design---------//
                          // Container(
                          //   height: 35,
                          //   padding: EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //       color: AppColors.greyColor,
                          //       borderRadius: BorderRadius.only(
                          //           bottomLeft: Radius.circular(10),
                          //           bottomRight: Radius.circular(10))),
                          // )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),

                //----------Check in out box with clock--------------//
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  // padding: EdgeInsets.all(24),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  // height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.modernPlantation,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "CLOCK",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //--------------Live Clock Area-----------------//
                      Container(
                        height: 200,
                        width: 200,
                        // padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(100)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current time:",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder(
                                stream:
                                    Stream.periodic(const Duration(seconds: 1)),
                                builder: (context, snapshot) {
                                  return GradientText(
                                    DateFormat('hh:mm:ss a')
                                        .format(DateTime.now()),
                                    colors: [
                                      // AppColors.modernLightBrown,
                                      AppColors.modernGreen,
                                      AppColors.modernBlue,
                                    ],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )

                                      //  Text(
                                      //     DateFormat('hh:mm:ss a')
                                      //         .format(DateTime.now()),
                                      //     style: TextStyle(
                                      //         fontSize: 20,
                                      //         color: Colors.pink.shade600,
                                      //         fontWeight: FontWeight.w700)
                                      //         )
                                      ;
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Date:" +
                                    DateFormat('MM/dd/yyyy')
                                        .format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => controller.isWeatherLoading.value
                                ? Container(
                                    height: 20,
                                    child: SpinKitPulse(
                                      color: AppColors.modernSexyRed,
                                    ),
                                  )
                                : controller.weatherData.isEmpty
                                    ? Container()
                                    : GradientText(
                                        "${controller.weatherData["current_weather"]["temperature"]}${controller.weatherData["hourly_units"]["temperature_2m"]}",
                                        colors: [
                                          // AppColors.modernLightBrown,
                                          AppColors.modernCoral,
                                          AppColors.modernSexyRed,
                                        ],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //------Check In Button------------//
                      Obx(() => controller.isCheckingInOut.value
                          ? SpinKitThreeBounce(
                              color: controller.isCheckedIn.value
                                  ? AppColors.modernRed
                                  : AppColors.modernGreen,
                            )
                          : controller.isCheckedIn.value
                              ? Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: COMMONWIDGET.button(
                                      height: 50,
                                      title: "Check Out",
                                      backgroudcolor: Colors.red.shade400,
                                      funtion: () {
                                        controller.requestCheckOut();
                                      }),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: COMMONWIDGET.button(
                                      height: 50,
                                      title: "Check In",
                                      backgroudcolor: Color(0xff25ae7a),
                                      funtion: () {
                                        controller.requestCheckIn();
                                      }),
                                )),

                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => controller.address.isEmpty
                          ? Container(
                              child: Center(
                                child: Text("NO LOCATION FOUND!"),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.isLocationLoading.value
                                    ? [
                                        SpinKitRipple(
                                          color: AppColors.modernGreen,
                                        )
                                      ]
                                    : [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.grey.shade600,
                                        ),
                                        Expanded(
                                          child: Text(
                                            " ${controller.address}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                              ),
                            ))
                    ],
                  ),
                ),
                //--------------------Last Chekc In View--------------//
                Obx(() => controller.latestActivity.isEmpty
                    ? Container()
                    : SizedBox(
                        height: 20,
                      )),
                Obx(() => controller.latestActivity.isEmpty
                    ? Container()
                    : Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        // padding: EdgeInsets.all(24),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.modernCoral,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Latest Activity",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade100,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Text(
                                "${controller.latestActivity['title']}" +
                                    " at "
                                        "${controller.latestActivity['time']}" +
                                    " in " +
                                    "${controller.latestActivity['mode']} mode",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      )),
                // //-----------------Order History Changer------------------//
                // Obx(() => controller.attendanceHistory.length == 0
                //     ? Container()
                //     : space(horizontal: 16)),
                SizedBox(
                  height: 20,
                ),

                ExpandablePanel(
                  controller: ExpandableController(initialExpanded: true),
                  theme: ExpandableThemeData(
                      tapBodyToCollapse: true,
                      // hasIcon: false,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      // iconPlacement: ExpandablePanelIconPlacement.right,

                      animationDuration: const Duration(milliseconds: 500),
                      // tapBodyToExpand: true,
                      expandIcon: Icons.arrow_circle_down,
                      collapseIcon: Icons.arrow_circle_up),
                  header: Container(
                    height: 80,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    width: double.maxFinite,
                    // color: AppColors.modernPurple,
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   width: 0.8,
                        //   color: Colors.white,
                        // ),
                        color: AppColors.modernPurple),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.time_to_leave,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Short leave management",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Icon(
                            Icons.touch_app,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Container(
                      margin: EdgeInsets.symmetric(horizontal: 17),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          border: Border.all(
                              width: 1, color: AppColors.modernPurple)),

                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      // padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    // margin: EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: AppColors.modernPurple,
                                      // borderRadius: BorderRadius.only(
                                      //     topLeft: Radius.circular(10),
                                      //     topRight: Radius.circular(10))
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Short leave",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade100,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.grey.shade200,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 24),
                                      child: Column(
                                        children: [
                                          Text(
                                            "You can request a temporary movement time for official or personal reason",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          COMMONWIDGET.button(
                                              height: 40,
                                              title: "New short leave",
                                              backgroudcolor:
                                                  AppColors.modernPurple,
                                              funtion: () {
                                                print("Pressed");
                                                return shortLeaveTransactionAlert(
                                                    controller: controller);
                                              }),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() => Container(
                                  // height: 400,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  // padding: EdgeInsets.symmetric(horizontal: 5),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: controller.isLeaveHistory.value
                                      ? SpinKitThreeInOut(
                                          color: AppColors.modernPurple,
                                        )
                                      : controller.leaveHistory.isEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 50,
                                                  child: Image.asset(
                                                    "assets/images/empty.png",
                                                    fit: BoxFit.cover,
                                                    color:
                                                        AppColors.modernGreen,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "No short leave history!",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.modernPurple,
                                                    // borderRadius:
                                                    //     BorderRadius.only(
                                                    //         topLeft: Radius
                                                    //             .circular(10),
                                                    //         topRight: Radius
                                                    //             .circular(
                                                    //                 10))
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Entry date",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.grey
                                                                  .shade100,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "On date",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.grey
                                                                  .shade100,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "Leave type",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.grey
                                                                  .shade100,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.grey
                                                                  .shade100,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //------Dynamic items------//
                                                Container(
                                                  height: 300,
                                                  width: double.maxFinite,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children:
                                                          controller
                                                              .leaveHistory
                                                              .map(
                                                                  (element) =>
                                                                      Container(
                                                                        // margin:
                                                                        //     EdgeInsets.symmetric(vertical: 5),
                                                                        padding:
                                                                            EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(color: Colors.grey.shade200),
                                                                        child:
                                                                            Row(
                                                                          // mainAxisAlignment:
                                                                          //     MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["START_DATE"].toString().split("T")[0],
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["END_DATE"].toString().split("T")[0],
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["LEAVE_TYPE"],
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["APRVL_FNL_STS_TYPE"],
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ))
                                                              .toList(),
                                                    ),
                                                  ),
                                                ),
                                                //---Buttom curve design---------//
                                                // Container(
                                                //   height: 35,
                                                //   padding: EdgeInsets.all(10),
                                                //   decoration: BoxDecoration(
                                                //       color: AppColors.greyColor,
                                                //       borderRadius: BorderRadius.only(
                                                //           bottomLeft: Radius.circular(10),
                                                //           bottomRight: Radius.circular(10))),
                                                // )
                                              ],
                                            ),
                                )),
                            SizedBox(height: 20),
                          ],
                        ),
                      )),
                ),
                //Short leave section////
                SizedBox(
                  height: 20,
                ),

                ExpandablePanel(
                  controller: ExpandableController(initialExpanded: true),
                  theme: ExpandableThemeData(
                      tapBodyToCollapse: true,
                      // hasIcon: false,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      // iconPlacement: ExpandablePanelIconPlacement.right,

                      animationDuration: const Duration(milliseconds: 500),
                      // tapBodyToExpand: true,
                      expandIcon: Icons.arrow_circle_down,
                      collapseIcon: Icons.arrow_circle_up),
                  header: Container(
                    height: 80,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    width: double.maxFinite,
                    color: AppColors.modernGreen,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Movement management",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Icon(
                            Icons.touch_app,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Container(
                      margin: EdgeInsets.symmetric(horizontal: 17),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          border: Border.all(
                              width: 1, color: AppColors.modernGreen)),
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    // margin: EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: AppColors.modernGreen,
                                      // borderRadius: BorderRadius.only(
                                      //     topLeft: Radius.circular(10),
                                      //     topRight: Radius.circular(10))
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Movement",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade100,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.grey.shade200,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 24),
                                      child: Column(
                                        children: [
                                          Text(
                                            "You can request a temporary movement time for official or personal reason",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          COMMONWIDGET.button(
                                              height: 40,
                                              title: "Apply new movement",
                                              backgroudcolor: Color(0xff25ae7a),
                                              funtion: () {
                                                print("Pressed");
                                                return movementTransactionAlert(
                                                    controller: controller);
                                              }),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Obx(() => Container(
                                  // height: 400,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),

                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: controller.ismLeaveHistory.value
                                      ? SpinKitThreeInOut(
                                          color: AppColors.modernGreen,
                                        )
                                      : controller.mleaveHistory.isEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 50,
                                                  child: Image.asset(
                                                    "assets/images/empty.png",
                                                    fit: BoxFit.cover,
                                                    color:
                                                        AppColors.modernGreen,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "No movement history!",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.modernGreen,
                                                    // borderRadius:
                                                    //     BorderRadius.only(
                                                    //         topLeft: Radius
                                                    //             .circular(10),
                                                    //         topRight: Radius
                                                    //             .circular(
                                                    //                 10))
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Start date",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey.shade100,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "End date",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey.shade100,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "Leave type",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey.shade100,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey.shade100,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //------Dynamic items------//
                                                Container(
                                                  // height: 300,
                                                  width: double.maxFinite,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children:
                                                          controller
                                                              .mleaveHistory
                                                              .map(
                                                                  (element) =>
                                                                      Container(
                                                                        // margin:
                                                                        //     EdgeInsets.symmetric(vertical: 5),
                                                                        padding:
                                                                            EdgeInsets.all(10),
                                                                        decoration:
                                                                            BoxDecoration(color: Colors.grey.shade200),
                                                                        child:
                                                                            Row(
                                                                          // mainAxisAlignment:
                                                                          //     MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["START_DATE"].toString().split("T")[0],
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["END_DATE"].toString().split("T")[0],
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["LEAVE_TYPE"],
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                element["APRVL_FNL_STS_TYPE"],
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ))
                                                              .toList(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
                ),
                //Movement section////

                SizedBox(
                  height: 20,
                ),
                kDebugMode
                    ? ZoomTapAnimation(
                        onTap: () {
                          debugConsole(controller: controller);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.modernRed,
                          ),
                          child: Center(
                              child: Text(
                            "Show",
                            style: TextStyle(color: Colors.white),
                          )),
                        ))
                    : Container()
              ],
            ),
          ),
        ));
  }

  static spacae({double? vertical, double? horizontal}) {
    return Container(
      color: Colors.grey.shade600,
      height: 1,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          vertical: vertical ?? 20, horizontal: horizontal ?? 0),
    );
  }

//----------------------------------Pop up for movement---------------------//

  static movementTransactionAlert(
      {required AttendancescreenController controller}) {
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
                      Expanded(
                        child: Text(
                          "Movement Transaction",
                          style: TextStyle(),
                        ),
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Start date: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  // alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  // height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.7,
                                          color: Colors.grey.shade600),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DateTimePicker(
                                    // icon: Icon(Icons.edit),
                                    textAlign: TextAlign.center,
                                    use24HourFormat: false,
                                    initialValue:
                                        controller.startDate.toString(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    // dateLabelText: 'Date',
                                    onChanged: (val) {
                                      controller.dateChanger(value: val);
                                    },
                                    validator: (val) {
                                      print(val);
                                      return null;
                                    },
                                    onSaved: (val) {
                                      controller.startDate =
                                          DateTime.parse(val!);
                                      print(controller.startDate);
                                    },
                                  ),

                                  //  CupertinoDatePicker(
                                  //   mode: CupertinoDatePickerMode.date,
                                  //   initialDateTime: controller.dateTime,
                                  //   onDateTimeChanged: (DateTime newDateTime) {
                                  //     controller.dateTime = newDateTime;
                                  //     print(controller.dateTime);
                                  //   },
                                  // ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "End date: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  // alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  // height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.7,
                                          color: Colors.grey.shade600),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DateTimePicker(
                                    // icon: Icon(Icons.edit),
                                    textAlign: TextAlign.center,
                                    use24HourFormat: false,
                                    initialValue: controller.endDate.toString(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    // dateLabelText: 'Date',
                                    onChanged: (val) {
                                      controller.endDate = DateTime.parse(val);
                                      controller.daysCounter();
                                      print(controller.endDate);
                                    },
                                    validator: (val) {
                                      print(val);
                                      return null;
                                    },
                                    onSaved: (val) {
                                      controller.endDate = DateTime.parse(val!);
                                      print(controller.endDate);
                                    },
                                  ),

                                  //  CupertinoDatePicker(
                                  //   mode: CupertinoDatePickerMode.date,
                                  //   initialDateTime: controller.dateTime,
                                  //   onDateTimeChanged: (DateTime newDateTime) {
                                  //     controller.dateTime = newDateTime;
                                  //     print(controller.dateTime);
                                  //   },
                                  // ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Start hour--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Start hour: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    //hour//
                                    Obx(() {
                                      return controller.HourValue.isEmpty
                                          ? Container()
                                          : Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  // color: Colors.blueGrey.shade200,
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade600),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: double.maxFinite,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  alignment: Alignment.center,
                                                  value: controller
                                                      .dropdownHourValue.value,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                  elevation: 2,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  onChanged:
                                                      (String? newValue) {
                                                    controller
                                                        .DropdownHourValueUpdater(
                                                            newValue!);
                                                  },
                                                  items: controller
                                                      .HourValue.value
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                    }),
                                    SizedBox(height: 10),
                                    //minutes//
                                    Obx(() {
                                      return controller.MinuteValue.isEmpty
                                          ? Container()
                                          : Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  // color: Colors.blueGrey.shade200,
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade600),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: double.maxFinite,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  alignment: Alignment.center,
                                                  value: controller
                                                      .dropdownMinuteValue
                                                      .value,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                  elevation: 2,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  onChanged:
                                                      (String? newValue) {
                                                    controller
                                                        .DropdownMinuteValueUpdater(
                                                            newValue!);
                                                  },
                                                  items: controller
                                                      .MinuteValue.value
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Movement nature section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Movement nature: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(() {
                                  return controller.movementNature.isEmpty
                                      ? Container()
                                      : Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              // color: Colors.blueGrey.shade200,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade600),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: double.maxFinite,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              alignment: Alignment.center,
                                              value: controller
                                                  .dropdownMovementNatureValue
                                                  .value,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey.shade900,
                                              ),
                                              elevation: 2,
                                              style: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                              onChanged: (String? newValue) {
                                                controller
                                                    .DropdownMovementNatureValueUpdater(
                                                        newValue!);
                                              },
                                              items: controller
                                                  .movementNature.value
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //--Total leave days--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Total tour days: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Total leave days",
                                        controller: controller.numberOfDays,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Responsible Employee id--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Responsible employee ID: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Responsible  ID",
                                        controller: controller.responsibleEmpId,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Movement type section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Movement type: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(() {
                                  return controller.movementType.isEmpty
                                      ? Container()
                                      : Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              // color: Colors.blueGrey.shade200,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade600),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: double.maxFinite,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              alignment: Alignment.center,
                                              value: controller
                                                  .dropdownMovementTypeValue
                                                  .value,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey.shade900,
                                              ),
                                              elevation: 2,
                                              style: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                              onChanged: (String? newValue) {
                                                controller
                                                    .DropdownMovementTypeValueUpdater(
                                                        newValue!);
                                              },
                                              items: controller
                                                  .movementType.value
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Transaction type section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Transaction type: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(() {
                                  return controller.TransactionType.isEmpty
                                      ? Container()
                                      : Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              // color: Colors.blueGrey.shade200,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade600),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: double.maxFinite,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              alignment: Alignment.center,
                                              value: controller
                                                  .dropdownTransactionTypeValue
                                                  .value,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey.shade900,
                                              ),
                                              elevation: 2,
                                              style: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                              onChanged: (String? newValue) {
                                                controller
                                                    .DropdownTransactionTypeValueUpdater(
                                                        newValue!);
                                              },
                                              items: controller
                                                  .TransactionType.value
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Duration value--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Duration: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(() {
                                  return controller.DurationValue.isEmpty
                                      ? Container()
                                      : Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              // color: Colors.blueGrey.shade200,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade600),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: double.maxFinite,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              alignment: Alignment.center,
                                              value: controller
                                                  .dropdownDurationValue.value,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey.shade900,
                                              ),
                                              elevation: 2,
                                              style: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                              onChanged: (String? newValue) {
                                                controller
                                                    .DropdownDurationValueUpdater(
                                                        newValue!);
                                              },
                                              items: controller
                                                  .DurationValue.value
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Reason of leave section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Reason: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Reason of leave",
                                        controller: controller.reasonOfLeave,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Phone number section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Contact number: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Phone number",
                                        controller: controller.phoneNumber,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Address during leave section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Address during leave: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Address during leave",
                                        controller:
                                            controller.addressDuringLeave,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Address during leave section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Remarks: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Remarks",
                                        controller:
                                            controller.addressDuringLeave,
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
                            // Get.back();
                            print(
                                "New start date time : ${controller.startDate}");
                            print(
                                "New end date time : ${controller.startDate}");
                            // controller.requestApplication();
                            // controller.addtoOfflineData(
                            //     data: data, date: controller.dateTime);
                            // callback();
                            controller.requestMovement();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("Apply movement",
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

  static shortLeaveTransactionAlert(
      {required AttendancescreenController controller}) {
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
                      Expanded(
                        child: Text(
                          "Short Leave Transaction",
                          style: TextStyle(),
                        ),
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
                    height: MediaQuery.of(Get.context!).size.height / 1.5,
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
                                  "On date: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  // alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  // height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.7,
                                          color: Colors.grey.shade600),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DateTimePicker(
                                    // icon: Icon(Icons.edit),
                                    textAlign: TextAlign.center,
                                    use24HourFormat: false,
                                    initialValue:
                                        controller.sstartDate.toString(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    // dateLabelText: 'Date',
                                    onChanged: (val) {
                                      controller.sdateChanger(value: val);
                                    },
                                    validator: (val) {
                                      print(val);
                                      return null;
                                    },
                                    onSaved: (val) {
                                      controller.sstartDate =
                                          DateTime.parse(val!);
                                      print(controller.sstartDate);
                                    },
                                  ),

                                  //  CupertinoDatePicker(
                                  //   mode: CupertinoDatePickerMode.date,
                                  //   initialDateTime: controller.dateTime,
                                  //   onDateTimeChanged: (DateTime newDateTime) {
                                  //     controller.dateTime = newDateTime;
                                  //     print(controller.dateTime);
                                  //   },
                                  // ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Start time(24 Hours): ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    //hour//
                                    Obx(() {
                                      return controller.sHourValue.isEmpty
                                          ? Container()
                                          : Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  // color: Colors.blueGrey.shade200,
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade600),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: double.maxFinite,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  alignment: Alignment.center,
                                                  value: controller
                                                      .dropdownsHourValue.value,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                  elevation: 2,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  onChanged:
                                                      (String? newValue) {
                                                    controller
                                                        .DropdownsHourValueUpdater(
                                                            newValue!);
                                                  },
                                                  items: controller
                                                      .sHourValue.value
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                    }),
                                    SizedBox(height: 10),
                                    //minutes//
                                    Obx(() {
                                      return controller.sMinuteValue.isEmpty
                                          ? Container()
                                          : Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  // color: Colors.blueGrey.shade200,
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade600),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 5),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: double.maxFinite,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  alignment: Alignment.center,
                                                  value: controller
                                                      .dropdownsMinuteValue
                                                      .value,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                  elevation: 2,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  onChanged:
                                                      (String? newValue) {
                                                    controller
                                                        .DropdownsMinuteValueUpdater(
                                                            newValue!);
                                                  },
                                                  items: controller
                                                      .sMinuteValue.value
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //--Duration value--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Duration: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(() {
                                  return controller.sDurationValue.isEmpty
                                      ? Container()
                                      : Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              // color: Colors.blueGrey.shade200,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade600),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: double.maxFinite,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              alignment: Alignment.center,
                                              value: controller
                                                  .dropdownsDurationValue.value,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey.shade900,
                                              ),
                                              elevation: 2,
                                              style: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                              onChanged: (String? newValue) {
                                                controller
                                                    .DropdownsDurationValueUpdater(
                                                        newValue!);
                                              },
                                              items: controller
                                                  .sDurationValue.value
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //--Responsible Employee id--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Responsible employee ID: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Responsible  ID",
                                        controller:
                                            controller.sresponsibleEmpId,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //--Reason of leave section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Reason: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Reason of leave",
                                        controller: controller.sreasonOfLeave,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //--Phone number section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Contact number: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Phone number",
                                        controller: controller.sphoneNumber,
                                        obsecure: false,
                                        maxline: 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //--Address during leave section--//
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Remarks: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: COMMONWIDGET.generalTextBox(
                                        hinttext: "Remarks",
                                        controller: controller.sremarks,
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
                            // Get.back();
                            print(
                                "New start date time : ${controller.startDate}");
                            print(
                                "New end date time : ${controller.startDate}");
                            // controller.requestApplication();
                            // controller.addtoOfflineData(
                            //     data: data, date: controller.dateTime);
                            // callback();
                            controller.requestShortLeave();
                          },
                          child: Obx(() => controller.isShortLeaveLoading.value
                              ? SpinKitThreeBounce(
                                  color: AppColors.modernGreen,
                                )
                              : Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.modernPurple,
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Text("Apply",
                                      style: TextStyle(color: Colors.white)),
                                )),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  static debugConsole({required AttendancescreenController controller}) {
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
                      Expanded(
                        child: Text(
                          "Debug data",
                          style: TextStyle(),
                        ),
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
                    height: MediaQuery.of(Get.context!).size.height / 1.5,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                        child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: AppColors.modernSexyRed,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Longitude",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Lattitude",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade100,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          //------Dynamic items------//
                          controller.debugList.length == 0
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        child: Image.asset(
                                          "assets/images/empty.png",
                                          fit: BoxFit.cover,
                                          color: AppColors.modernGreen,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "No data provided!",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  // height: 300,
                                  width: double.maxFinite,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: controller.debugList
                                          .map((element) => Container(
                                                // margin:
                                                //     EdgeInsets.symmetric(vertical: 5),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.grey.shade200),
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        element["time"],
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        element["longitude"]
                                                            .toString()
                                                            .split("T")[0],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        element["lattitude"]
                                                            .toString()
                                                            .split("T")[0],
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        element["name"],
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                          //---Buttom curve design---------//
                          // Container(
                          //   height: 35,
                          //   padding: EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //       color: AppColors.greyColor,
                          //       borderRadius: BorderRadius.only(
                          //           bottomLeft: Radius.circular(10),
                          //           bottomRight: Radius.circular(10))),
                          // )
                        ],
                      ),
                    )),
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
                          child: Obx(() => controller.isShortLeaveLoading.value
                              ? SpinKitThreeBounce(
                                  color: AppColors.modernGreen,
                                )
                              : Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.modernPurple,
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Text("Hide",
                                      style: TextStyle(color: Colors.white)),
                                )),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
