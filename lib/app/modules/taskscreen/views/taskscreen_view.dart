import 'dart:ui';

import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/taskscreen_controller.dart';

class TaskscreenView extends GetView<TaskscreenController> {
  const TaskscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Task Management",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
          child: Obx(() => controller.tasklist.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        bottom: 45,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.tasklist.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  // height: 300,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    // color: Color.fromARGB(249, 207, 236, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    // border: Border.all(
                                    //     width: 0.5, color: Colors.grey.shade400)
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.shade900.withOpacity(0.1),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 3,
                                    //     offset:
                                    //         Offset(0, 5), // horizontal, vertical offset
                                    //   ),
                                    // ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          // color: Color(0xff25ae7a),
                                          color:
                                              Color.fromARGB(255, 37, 147, 174),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                        ),
                                        child: Text(
                                          "TASK ID: ${controller.tasklist[index]["taskId"]}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade100,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Task: ${controller.tasklist[index]["taskTitle"]}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Assigned by: ${controller.tasklist[index]["taskProvider"]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "Deadline: ${controller.tasklist[index]["taskDeadline"]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      ZoomTapAnimation(
                                        onTap: () {
                                          // taskViewAlert(
                                          //     controller: controller,
                                          //     index: index);
                                          Get.toNamed(Routes.TASKDETAILSCREEN,
                                              arguments:
                                                  controller.tasklist[index]);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: double.maxFinite,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Color(0xff25ae7a),
                                              // color: Color(0xff25ae7a),
                                              borderRadius:
                                                  BorderRadius.circular(10)
                                              // borderRadius: BorderRadius.only(
                                              //     topLeft: Radius.circular(10),
                                              //     topRight: Radius.circular(10)),
                                              ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.visibility,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Show details",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey.shade100,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // ZoomTapAnimation(
                                      //   onTap: () {
                                      //     // taskViewAlert(
                                      //     //     controller: controller,
                                      //     //     index: index);
                                      //     Get.toNamed(Routes.TASKDETAILSCREEN);
                                      //   },
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     height: 40,
                                      //     width: double.maxFinite,
                                      //     margin: EdgeInsets.all(10),
                                      //     decoration: BoxDecoration(
                                      //         color: AppColors.modernCoolPink,
                                      //         // color: Color(0xff25ae7a),
                                      //         borderRadius:
                                      //             BorderRadius.circular(10)
                                      //         // borderRadius: BorderRadius.only(
                                      //         //     topLeft: Radius.circular(10),
                                      //         //     topRight: Radius.circular(10)),
                                      //         ),
                                      //     child: Row(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,
                                      //       children: [
                                      //         Icon(
                                      //           Icons.splitscreen,
                                      //           color: Colors.white,
                                      //         ),
                                      //         Text(
                                      //           "Split task",
                                      //           style: TextStyle(
                                      //               fontSize: 18,
                                      //               color: Colors.grey.shade100,
                                      //               fontWeight:
                                      //                   FontWeight.w600),
                                      //           textAlign: TextAlign.center,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                );
                              }),
                        ),
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
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.modernGreen,
                              // borderRadius: BorderRadius.circular(10)
                            ),
                            alignment: Alignment.center,
                            child: Text("Assign new task",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
        ));
  }

  // static taskViewAlert(
  //     {required TaskscreenController controller, required int index}) {
  //   return Get.generalDialog(
  //       barrierDismissible: false,
  //       transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: 4 * anim1.value,
  //               sigmaY: 4 * anim1.value,
  //             ),
  //             child: FadeTransition(
  //               child: child,
  //               opacity: anim1,
  //             ),
  //           ),
  //       pageBuilder: (ctx, anim1, anim2) => MediaQuery(
  //             data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
  //             child: WillPopScope(
  //               onWillPop: () async => false,
  //               child: AlertDialog(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20)),
  //                 title: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       "Task details",
  //                       style: TextStyle(),
  //                     ),
  //                     InkWell(
  //                       onTap: () {
  //                         Get.back();
  //                       },
  //                       child: Container(
  //                         padding: EdgeInsets.all(5),
  //                         child: Center(
  //                             child: Icon(
  //                           Icons.close,
  //                           color: Colors.red.shade800,
  //                           size: 20,
  //                         )),
  //                         decoration: BoxDecoration(
  //                             color: Colors.grey.shade200,
  //                             borderRadius: BorderRadius.circular(100)),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 content: Container(
  //                   // height: 300,
  //                   width: double.maxFinite,
  //                   child: SingleChildScrollView(
  //                     child: Padding(
  //                       padding: EdgeInsets.symmetric(vertical: 10),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             "TASK ID: ${controller.tasklist[index]["taskId"]}",
  //                             style: TextStyle(
  //                                 fontSize: 18,
  //                                 color: Colors.grey.shade900,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Task: ${controller.tasklist[index]["taskTitle"]}",
  //                             style: TextStyle(
  //                                 fontSize: 22,
  //                                 color: Colors.grey.shade900,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Details: ${controller.tasklist[index]["taskDetails"]}",
  //                             style: TextStyle(
  //                                 fontSize: 16,
  //                                 color: Colors.grey.shade700,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Assigned by: ${controller.tasklist[index]["taskProvider"]}",
  //                             style: TextStyle(
  //                                 fontSize: 16,
  //                                 color: Colors.grey.shade700,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Assigned date: ${controller.tasklist[index]["taskAssignDate"]}",
  //                             style: TextStyle(
  //                                 fontSize: 16,
  //                                 color: Colors.grey.shade700,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Deadline: ${controller.tasklist[index]["taskDeadline"]}",
  //                             style: TextStyle(
  //                                 fontSize: 16,
  //                                 color: Colors.grey.shade700,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Status: ${controller.tasklist[index]["taskStatus"]}",
  //                             style: TextStyle(
  //                                 fontSize: 16,
  //                                 color: Colors.grey.shade700,
  //                                 fontWeight: FontWeight.w500),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Priority: ${controller.tasklist[index]["taskPriority"]}",
  //                             style: TextStyle(
  //                                 fontSize: 18,
  //                                 color: Colors.grey.shade900,
  //                                 fontWeight: FontWeight.w600),
  //                             // textAlign: TextAlign.center,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 actionsPadding:
  //                     EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //                 actions: [
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                           child: InkWell(
  //                         onTap: () {
  //                           Get.back();
  //                         },
  //                         child: Container(
  //                           height: 40,
  //                           decoration: BoxDecoration(
  //                               color: AppColors.modernGreen,
  //                               borderRadius: BorderRadius.circular(10)),
  //                           alignment: Alignment.center,
  //                           child: Text("OKAY",
  //                               style: TextStyle(color: Colors.white)),
  //                         ),
  //                       ))
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ));
  // }

  static timeSelectionAlert({required TaskscreenController controller}) {
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
                        "Assign new task",
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
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Assign date: ",
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
                                      controller.daysCounter();
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
                                  "Deadline: ",
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
                                      controller.dateChanger(value: val);
                                      controller.daysCounter();
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
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Task priority: ",
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
                                    return controller.priorityType.isEmpty
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
                                                    .dropdownPriorityTypeValue
                                                    .value,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey.shade900,
                                                ),
                                                elevation: 2,
                                                style: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                onChanged: (String? newValue) {
                                                  controller
                                                      .DropdownPriorityTypeValueUpdater(
                                                          newValue!);
                                                },
                                                items: controller
                                                    .priorityType.value
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Employee: ",
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
                                    return controller.priorityType.isEmpty
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
                                                    .dropdownEmployeeTypeValue
                                                    .value,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey.shade900,
                                                ),
                                                elevation: 2,
                                                style: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                onChanged: (String? newValue) {
                                                  controller
                                                      .DropdownEmployeeValueUpdater(
                                                          newValue!);
                                                },
                                                items: controller
                                                    .employeeList.value
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Report to: ",
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
                                    return controller.employeeList.isEmpty
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
                                                    .dropdownReportingEmpValue
                                                    .value,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey.shade900,
                                                ),
                                                elevation: 2,
                                                style: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                onChanged: (String? newValue) {
                                                  controller
                                                      .DropdownReportingValueUpdater(
                                                          newValue!);
                                                },
                                                items: controller
                                                    .employeeList.value
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Assignment",
                                  controller: controller.assignment,
                                  obsecure: false,
                                  maxline: 3)),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: COMMONWIDGET.generalTextBox(
                                  hinttext: "Special remark",
                                  controller: controller.specialRemark,
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
                                  print(
                                      "New start date time : ${controller.startDate}");
                                  print(
                                      "New end date time : ${controller.startDate}");

                                  // controller.addtoOfflineData(
                                  //     data: data, date: controller.dateTime);
                                  // callback();
                                },
                                child: Obx(
                                  () => controller.isLeaveRequest.value
                                      ? SpinKitThreeBounce(
                                          color: AppColors.modernGreen,
                                        )
                                      : Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: AppColors.modernGreen,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Text("APPLY",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                )))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
