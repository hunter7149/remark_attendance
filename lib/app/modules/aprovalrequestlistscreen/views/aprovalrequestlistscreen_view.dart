import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/aprovalrequestlistscreen_controller.dart';

class AprovalrequestlistscreenView
    extends GetView<AprovalrequestlistscreenController> {
  const AprovalrequestlistscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "List of request",
            backFunction: () {},
            leadingIcon: Icons.arrow_back,
            leadingFunction: () {
              Get.back();
            }),
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              // padding: EdgeInsets.all(10),
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.modernBlue),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppColors.modernBlue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13))),
                      child: Center(
                        child: Text(
                          "Employee Id: ${"M662"}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Expanded(
                          child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(children: [
                          infoRow(
                              title: "Name: ",
                              data: 'Mohammad Khalid Bin Oalid'),
                          infoRow(title: "Type: ", data: "Leave SL"),
                          infoRow(
                              title: "Application date: ", data: "10-2-2023"),
                          infoRow(title: "Start date: ", data: "11-02-2023"),
                          infoRow(title: "End date: ", data: "13-02-2023"),
                        ]),
                      )),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ZoomTapAnimation(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.modernSexyRed,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "Reject",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ZoomTapAnimation(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.modernGreen,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "Approve",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            );
          }),
        )));
  }

  static infoRow({required dynamic title, required dynamic data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${title}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Text(
          "${data}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
