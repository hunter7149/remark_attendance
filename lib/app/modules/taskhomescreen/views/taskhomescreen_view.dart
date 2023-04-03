import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/globals/common_widgets.dart';
import '../controllers/taskhomescreen_controller.dart';

class TaskhomescreenView extends GetView<TaskhomescreenController> {
  const TaskhomescreenView({Key? key}) : super(key: key);
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
      body: const Center(
        child: Text(
          'TaskhomescreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
