import 'package:attendance/app/data/globals/app_colors.dart';
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
}
