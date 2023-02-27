import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/globals/app_colors.dart';
import '../controllers/profileviewscreen_controller.dart';

class ProfileviewscreenView extends GetView<ProfileviewscreenController> {
  const ProfileviewscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Profile",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Obx(
            () => Column(
              children: [],
            ),
          )),
        )));
  }

  textView({required String text}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade100,
          fontWeight: FontWeight.w400),
    );
  }
}
