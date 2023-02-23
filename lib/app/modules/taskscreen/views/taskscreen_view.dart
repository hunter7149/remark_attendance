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
                                onTap: () {},
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
}
