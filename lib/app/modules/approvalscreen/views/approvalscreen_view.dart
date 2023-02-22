import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../data/globals/app_colors.dart';
import '../../../data/globals/common_widgets.dart';
import '../controllers/approvalscreen_controller.dart';

class ApprovalscreenView extends GetView<ApprovalscreenController> {
  const ApprovalscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: COMMONWIDGET.globalAppBar(
          leadingIcon: FontAwesomeIcons.clock,
          tittle: "Approval Management",
          backFunction: () {
            Get.back();
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            "Approval status",
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
                                  ? "Approved"
                                  : "Rejected",
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
            ],
          ),
        ),
      ),
    );
  }
}
