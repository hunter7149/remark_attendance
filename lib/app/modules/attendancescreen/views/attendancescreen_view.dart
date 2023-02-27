import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/attendancescreen_controller.dart';

class AttendancescreenView extends GetView<AttendancescreenController> {
  const AttendancescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            leadingIcon: FontAwesomeIcons.clock,
            tittle: "Attendance Management",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
          child: SingleChildScrollView(
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
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Attendance status",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Obx(() => Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 10),
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
                                    fontSize: 16,
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
                Obx(() => controller.attendanceHistory.length == 0
                    ? Container()
                    : Container(
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
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "In",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Out",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            //------Dynamic items------//
                            Column(
                              children: controller.attendanceHistory.reversed
                                  .map((element) => Container(
                                        // margin:
                                        //     EdgeInsets.symmetric(vertical: 5),
                                        padding: EdgeInsets.all(10),
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "  ${element["intime"].toString().split(" ")[1]} ${element["outtime"].toString().split(" ")[2]}   ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              element["intime"]
                                                  .toString()
                                                  .split(" ")[1],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "  ${element["outtime"].toString().split(" ")[1]} ${element["outtime"].toString().split(" ")[2]}   ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              element["status"],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                            //---Buttom curve design---------//
                            Container(
                              height: 35,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                            )
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
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mohammad Khalid Bin Oalid",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade900,
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
                                  return Text(
                                      DateFormat('hh:mm:ss a')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink.shade600,
                                          fontWeight: FontWeight.w700));
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Date:" +
                                    DateFormat('MM/dd/yyyy')
                                        .format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //------Check In Button------------//
                      Obx(() => controller.isCheckedIn.value
                          ? Container()
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
                      // SizedBox(
                      //   height: 20,
                      // ),
                      //------------Chekc Out Button------------//
                      Obx(() => controller.isCheckedIn.value
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
                          : Container()),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => controller.address.isEmpty
                          ? Container()
                          : Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.grey.shade600,
                                  ),
                                  Text(
                                    " ${controller.address}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ))
                    ],
                  ),
                ),
                //--------------------Last Chekc In View--------------//
                Obx(() => controller.attendanceHistory.length == 0
                    ? Container()
                    : space(horizontal: 16)),
                Obx(() => controller.attendanceHistory.length == 0
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
                                  color: AppColors.greyColor,
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
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "${controller.attendanceHistory[controller.attendanceHistory.length - 1]["activity"]}" +
                                    " at "
                                        "${controller.attendanceHistory[controller.attendanceHistory.length - 1]["intime"]}",
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Movement",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade900,
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
                                  title: "Request",
                                  backgroudcolor: Color(0xff25ae7a),
                                  funtion: () {
                                    Get.snackbar("Success", "Working");
                                  }),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  static space({double? vertical, double? horizontal}) {
    return Container(
      color: Colors.grey.shade600,
      height: 1,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          vertical: vertical ?? 20, horizontal: horizontal ?? 0),
    );
  }
}
