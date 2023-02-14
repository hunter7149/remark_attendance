import 'dart:ui';

import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/globals/common_widgets.dart';
import '../controllers/leavescreen_controller.dart';

class LeavescreenView extends GetView<LeavescreenController> {
  const LeavescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            leadingIcon: FontAwesomeIcons.calendar,
            tittle: "Leaves Management",
            backFunction: () {
              Get.back();
            }),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 60,
              right: 0,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    width: double.maxFinite,
                    // height: 400,
                    padding: EdgeInsets.all(10),
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
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Employee Id: 662",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          leaveCountView(
                              title: "Total leave", enjoyed: "06", total: "26"),
                          leaveCountView(
                              title: "Sick leave", enjoyed: "02", total: "13"),
                          leaveCountView(
                              title: "Casual leave", enjoyed: "04", total: "13")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                  Obx(() => controller.leaveApplication.isEmpty
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Last applied leave application",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Leave type: ${controller.leaveApplication['type']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Start date: ${controller.leaveApplication['start_date']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Total days: ${controller.leaveApplication['days']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Reason: ${controller.leaveApplication['reasonOfLeave']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Applied at: ${controller.leaveApplication['applicationDate']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      // height: 35,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: controller.leaveApplication[
                                                      'status'] ==
                                                  "pending"
                                              ? Colors.deepOrange
                                              : controller.leaveApplication[
                                                          'status'] ==
                                                      "approved"
                                                  ? Colors.green
                                                  : Colors.red,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          "Status: ${controller.leaveApplication['status']}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade100,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          "Leave history:",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => controller.leaveHistory.length == 0
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
                                      "Leave type",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Start date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Days enjoyed",
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
                                children: controller.leaveHistory
                                    .map((element) => Container(
                                          // margin:
                                          //     EdgeInsets.symmetric(vertical: 5),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  element["type"],
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  element["start_date"],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  element["days"],
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
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
                ],
              )),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ZoomTapAnimation(
                  onTap: () {
                    timeSelectionAlert(controller: controller);
                  },
                  child: Container(
                    height: 60,
                    color: AppColors.mainBlue,
                    child: Center(
                      child: Text(
                        "Apply for leave",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade100,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }

  static leaveCountView(
      {required String title, required String enjoyed, required String total}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.grey.shade500),
                // color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  enjoyed,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  " of ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  total,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static timeSelectionAlert({required LeavescreenController controller}) {
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
                    // height: 300,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Tap date to change date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            // height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7, color: Colors.grey.shade600),
                                borderRadius: BorderRadius.circular(10)),
                            child: DateTimePicker(
                              // icon: Icon(Icons.edit),
                              textAlign: TextAlign.center,
                              use24HourFormat: false,
                              initialValue: controller.dateTime.toString(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              // dateLabelText: 'Date',
                              onChanged: (val) {
                                controller.dateTime = DateTime.parse(val);
                                print(controller.dateTime);
                              },
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) {
                                controller.dateTime = DateTime.parse(val!);
                                print(controller.dateTime);
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
                          Obx(() {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  // color: Colors.blueGrey.shade200,
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade600),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 5),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: double.maxFinite,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  alignment: Alignment.center,
                                  value:
                                      controller.dropdownLeaveTypeValue.value,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey.shade900,
                                  ),
                                  elevation: 2,
                                  style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w300),
                                  onChanged: (String? newValue) {
                                    controller.DropdownLeaveTypeValueUpdater(
                                        newValue!);
                                  },
                                  items: controller.leaveType.value
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }),
                          Container(
                              margin: EdgeInsets.all(10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Number of days",
                                  controller: controller.numberOfDays,
                                  obsecure: false,
                                  keyboardType: TextInputType.number)),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Reason of leave",
                                  controller: controller.reasonOfLeave,
                                  obsecure: false,
                                  maxline: 4)),
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
                            print("New date time : ${controller.dateTime}");
                            controller.requestApplication();
                            // controller.addtoOfflineData(
                            //     data: data, date: controller.dateTime);
                            // callback();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.green.shade500,
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
