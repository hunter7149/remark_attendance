import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/taskdetailscreen_controller.dart';

class TaskdetailscreenView extends GetView<TaskdetailscreenController> {
  const TaskdetailscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Task list",
            backFunction: () {},
            leadingFunction: () {
              Get.back();
            }),
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.maxFinite,
                  // padding: EdgeInsets.only(bottom: 0),
                  child: Column(children: [
                    Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppColors.modernBlue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9))),
                      child: Center(
                          child: Text(
                        "TASK INFORMATION",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Task: ${controller.taskInfo["taskTitle"]}",
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
                      "Task Id: ${controller.taskInfo["taskId"]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Assigned by: ${controller.taskInfo["taskProvider"]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Deadline: ${controller.taskInfo["taskDeadline"]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Start",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              height: 20,
                              child: LinearProgressIndicator(
                                value: 0.8,
                                backgroundColor: AppColors.mainBlue,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.modernCoral),
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Complete",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.modernGreen,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "Mark as completed",
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ]),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.modernBlue),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  // height: 400,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColors.modernGreen),
                      // color: AppColors.mainBlue,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColors.modernGreen,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9))),
                        child: Center(
                            child: Text(
                          "SUB TASK",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        height: 350,
                        child: ListView.builder(
                            itemCount: controller.subtask.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                // height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.modernChocolate2)),
                                child: Column(children: [
                                  Container(
                                    height: 40,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: AppColors.modernChocolate2,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4))),
                                    child: Center(
                                        child: Text(
                                      "TASK INFORMATION",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Task: ${controller.taskInfo["taskTitle"]}",
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
                                    "Task Id: ${controller.taskInfo["taskId"]}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Assigned to: ${controller.taskInfo["taskProvider"]}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Deadline: ${controller.taskInfo["taskDeadline"]}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(
                                      value: 0.8,
                                      backgroundColor: AppColors.mainBlue,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.modernCoral),
                                    ),
                                  ),
                                  Text(
                                    "80% completed",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
