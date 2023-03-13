import 'dart:ui';

import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                                color: AppColors.greyColor,
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
                                                    color: Colors.white),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "  ${element["ATTN_DATE"]}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "${element["IN_TIME"]}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "${element["OUT_TIME"]}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "${element["ATTN_DAY_STS_TYPE"]}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                                "No data provided!",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )
                                        ]),
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
                              "CLOCK",
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
                                        SpinKitThreeBounce(
                                          color: AppColors.modernBlue,
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
                                    print("Pressed");
                                    return timeSelectionAlert(
                                        controller: controller);
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

//----------------------------------Pop up for movement---------------------//

  static timeSelectionAlert({required AttendancescreenController controller}) {
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
                        "Select your time",
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
                          Obx(() {
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: double.maxFinite,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        alignment: Alignment.center,
                                        value: controller
                                            .dropdownMovementNatureValue.value,
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
                                        items: controller.movementNature.value
                                            .map<DropdownMenuItem<String>>(
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Total leave days",
                                  controller: controller.numberOfDays,
                                  obsecure: false,
                                  maxline: 1)),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Responsible  ID",
                                  controller: controller.responsibleEmpId,
                                  obsecure: false,
                                  maxline: 1)),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(() {
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: double.maxFinite,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        alignment: Alignment.center,
                                        value: controller
                                            .dropdownMovementTypeValue.value,
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
                                        items: controller.movementType.value
                                            .map<DropdownMenuItem<String>>(
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
                          SizedBox(
                            height: 20,
                          ),
                          Obx(() {
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: double.maxFinite,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        alignment: Alignment.center,
                                        value: controller
                                            .dropdownTransactionTypeValue.value,
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
                                        items: controller.TransactionType.value
                                            .map<DropdownMenuItem<String>>(
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
                          SizedBox(
                            height: 20,
                          ),
                          Obx(() {
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                                        items: controller.DurationValue.value
                                            .map<DropdownMenuItem<String>>(
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Reason of leave",
                                  controller: controller.reasonOfLeave,
                                  obsecure: false,
                                  maxline: 1)),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Phone number",
                                  controller: controller.phoneNumber,
                                  obsecure: false,
                                  maxline: 1)),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Address during leave",
                                  controller: controller.addressDuringLeave,
                                  obsecure: false,
                                  maxline: 1)),
                        ],
                      ),
                    ),
                  ),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        // Expanded(
                        //   child: InkWell(
                        //     onTap: () {
                        //       Get.back();
                        //     },
                        //     child: Container(
                        //       height: 40,
                        //       decoration: BoxDecoration(
                        //           color: Colors.red.shade500,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       alignment: Alignment.center,
                        //       child: Text("No",
                        //           style: TextStyle(color: Colors.white)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Get.back();
                            print(
                                "New start date time : ${controller.startDate}");
                            print(
                                "New end date time : ${controller.startDate}");
                            // controller.requestApplication();
                            // controller.addtoOfflineData(
                            //     data: data, date: controller.dateTime);
                            // callback();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("SAVE",
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
