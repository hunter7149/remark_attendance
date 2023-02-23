import 'dart:ui';

import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                                  color: Color.fromARGB(255, 37, 147, 174),
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
                                padding: EdgeInsets.symmetric(vertical: 10),
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
                                  taskViewAlert(
                                      controller: controller, index: index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff25ae7a),
                                      // color: Color(0xff25ae7a),
                                      borderRadius: BorderRadius.circular(10)
                                      // borderRadius: BorderRadius.only(
                                      //     topLeft: Radius.circular(10),
                                      //     topRight: Radius.circular(10)),
                                      ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )),
        ));
  }

  static taskViewAlert(
      {required TaskscreenController controller, required int index}) {
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
                        "Task details",
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TASK ID: ${controller.tasklist[index]["taskId"]}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Task: ${controller.tasklist[index]["taskTitle"]}",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Details: ${controller.tasklist[index]["taskDetails"]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                              // textAlign: TextAlign.center,
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
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Assigned date: ${controller.tasklist[index]["taskAssignDate"]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Deadline: ${controller.tasklist[index]["taskDeadline"]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Status: ${controller.tasklist[index]["taskStatus"]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Priority: ${controller.tasklist[index]["taskPriority"]}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w600),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.modernGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text("OKAY",
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
