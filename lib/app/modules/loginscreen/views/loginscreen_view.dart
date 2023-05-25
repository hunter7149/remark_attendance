import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../../data/globals/common_widgets.dart';
import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  LoginscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ProsteBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    BezierCurveSection(
                      start: Offset(0, 200),
                      top: Offset(screenWidth / 2, 300),
                      end: Offset(screenWidth, 200),
                    ),
                  ],
                ),
                child: Container(height: 380, color: AppColors.mainBlue),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                // left: screenWidth / 2.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 4, color: AppColors.mainBlue),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        AppString.remarkLogo,
                        height: 96,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                // left: screenWidth / 2.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(100)),
                      // padding: EdgeInsets.all(10),
                      child: Image.asset(AppString.remarkText,
                          // height: 250,
                          // width: 220,
                          color: AppColors.modernPlantation),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                COMMONWIDGET.loginInput(
                    controller: controller.email,
                    hinttext: "Enter your username",
                    obsecure: false),
                SizedBox(
                  height: 20,
                ),
                passwordField(
                  hinttext: "Enter your password",
                  controller: controller,
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => controller.isLogingIn.value
                    ? Center(
                        child: SpinKitDoubleBounce(color: AppColors.modernBlue),
                      )
                    : COMMONWIDGET.button(
                        title: "LOGIN",
                        funtion: () {
                          controller.requestLogin();
                          // Get.toNamed(Routes.HOME);
                        },
                        height: 50)),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Dont have an account?',
                //       textAlign: TextAlign.center,
                //     ),
                //     Text(
                //       ' Create Account',
                //       style: TextStyle(
                //           fontSize: 16, color: Colors.grey.shade600),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ],
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
                controller.obsecure.value
                    ? Icons.visibility
                    : Icons.visibility_off,
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
