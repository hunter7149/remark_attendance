import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/app_strings.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/globals/common_widgets.dart';
import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  const LoginscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              AppString.remarkLogo,
              height: 96,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  COMMONWIDGET.loginInput(
                      controller: controller.email,
                      hinttext: "Enter your email",
                      obsecure: false),
                  SizedBox(
                    height: 20,
                  ),
                  passwordField(
                      hinttext: "Enter your password", controller: controller),
                  SizedBox(
                    height: 20,
                  ),
                  COMMONWIDGET.button(
                      title: "LOGIN",
                      funtion: () {
                        Get.toNamed(Routes.HOME);
                      },
                      height: 50),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ' Create Account',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  static passwordField(
      {required String hinttext, required LoginscreenController controller}) {
    return Obx(() {
      return TextField(
        controller: controller.password,
        obscureText: controller.obsecure.value,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.mainBlue,
                width: 1,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.obsecureUpdater();
              },
              child: Icon(
                Icons.visibility,
                color: AppColors.mainBlue,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.mainBlue,
            )),
      );
    });
  }
}
