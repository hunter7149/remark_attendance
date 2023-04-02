import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovalscreenController extends GetxController {
  RxList<Color> modernColors = [
    AppColors.modernBlue,
    AppColors.modernGreen,
    AppColors.modernPurple,
    AppColors.modernChocolate,
    AppColors.modernDeepSea,
    AppColors.modernCoolPink
  ].obs;

  RxList<Map<String, dynamic>> approvalData = <Map<String, dynamic>>[
    {
      "location": "RG",
      "name": "Leave Approval",
      "quanity": 12,
    },
    {
      "location": "RG",
      "name": "Short leave Recommendation",
      "quanity": 10,
    },
    {
      "location": "RG",
      "name": "Movement Approval",
      "quanity": 8,
    },
    {
      "location": "RG",
      "name": "Short leave Approval",
      "quanity": 13,
    },
    {
      "location": "FACTORY",
      "name": "Movemen Recomendation",
      "quanity": 5,
    },
    {
      "location": "RG",
      "name": "SL Approval",
      "quanity": 23,
    },
  ].obs;

  RxList<Map<String, dynamic>> listOfRequest = <Map<String, dynamic>>[
    {
      "location": "RG",
      "name": "Leave Approval",
      "quanity": 12,
    },
  ].obs;

//--------------------------------------------------Controller functions---------------------------------------------------------------------//
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
