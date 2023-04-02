import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/globals/app_colors.dart';
import '../../../data/globals/common_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/approvalscreen_controller.dart';

class ApprovalscreenView extends GetView<ApprovalscreenController> {
  const ApprovalscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            "Approval Management",
            style: TextStyle(color: Colors.grey.shade800),
          ),
          leading: ZoomTapAnimation(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade800,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Center(
                child: Text(
                  "Total: 34",
                  style: TextStyle(
                      color: AppColors.modernCoolPink,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Obx(() => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: controller.approvalData.length,
                    itemBuilder: (context, index) {
                      int randomIndex =
                          Random().nextInt(controller.modernColors.length);
                      // Get color at random index
                      Color randomColor = controller.modernColors[randomIndex];
                      return ZoomTapAnimation(
                        onTap: () {
                          Get.toNamed(Routes.APROVALREQUESTLISTSCREEN);
                        },
                        child: Container(
                          margin: EdgeInsets.all(16),
                          height: 250,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              // color: randomColor,
                              border: Border.all(width: 1, color: randomColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: randomColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50))),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.approvalData[index]['quanity']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Pending",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Text(
                                  "${controller.approvalData[index]['name']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                // height: 30,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: randomColor),
                                    // color: randomColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                child: Text(
                                  "Limit: ${"60 Days"}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: randomColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${controller.approvalData[index]['location']}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )),
        ));
  }
}
