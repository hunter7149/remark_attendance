import 'dart:async';

import 'package:attendance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.saveDeviceInfo();
    Timer(Duration(seconds: 2), () {
      controller.isSignedIn();
    });
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/logo/remark.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Image.asset(
                  'assets/logo/login_logo_hb.png',
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
