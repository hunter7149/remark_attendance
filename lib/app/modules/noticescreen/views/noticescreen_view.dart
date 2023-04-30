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
              ? Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/emptynotice.jpeg",
                          height: 200,
                        ),
                        Text(
                          "No pending notice!",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: controller.notices.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Container(
                            color: AppColors.modernRed,
                            child: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          // key: Key("${index}"),
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            controller.deleteNotice(index: index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            // padding: EdgeInsets.all(10),
                            height: 80,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: controller.notices[index]['title']
                                              .toString()
                                              .toLowerCase() ==
                                          "urgent"
                                      ? AppColors.modernRed
                                      : AppColors.modernGreen,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: controller.notices[index]
                                                          ['title']
                                                      .toString()
                                                      .toLowerCase() ==
                                                  "urgent"
                                              ? AppColors.modernRed
                                              : AppColors.modernGreen,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(9),
                                              bottomRight: Radius.circular(9))),
                                      child: Text(
                                        controller.notices[index]['title'] ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                      child: Text(
                                          controller.notices[index]['body'] ??
                                              "",
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )),
        ));
  }
}
