import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movementscreen_controller.dart';

class MovementscreenView extends GetView<MovementscreenController> {
  const MovementscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: COMMONWIDGET.globalAppBar(
          leadingIcon: Icons.time_to_leave,
          tittle: "Movement management",
          backFunction: () {
            Get.back();
          }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 80,
              color: Colors.blue,
            ),
            Text(
              "This feature is under development",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
