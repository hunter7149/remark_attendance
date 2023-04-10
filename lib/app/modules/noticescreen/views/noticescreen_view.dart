import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/noticescreen_controller.dart';

class NoticescreenView extends GetView<NoticescreenController> {
  const NoticescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Notices",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
          child: Obx(() => controller.notices[0].isEmpty
              ? Container()
              : Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: controller.notices.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          height: 80,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.modernGreen,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                  controller.notices[index]['title'] ?? "",
                                  style: TextStyle(color: Colors.black),
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                    child: Text(
                                        controller.notices[index]['body'] ?? "",
                                        style: TextStyle(color: Colors.black)))
                              ],
                            ),
                          ),
                        );
                      }),
                )),
        ));
  }
}
