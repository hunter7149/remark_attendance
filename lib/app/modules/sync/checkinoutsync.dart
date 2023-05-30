import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/repository/repository.dart';
import '../../api/service/prefrences.dart';

class CHECKINOUTSYNC {
  CheckInOutSync() async {
    List<dynamic> inData = Pref.readData(key: Pref.CHECK_IN_BACKUP) ?? [];
    List<dynamic> outData = Pref.readData(key: Pref.CHECK_OUT_BACKUP) ?? [];

    if (inData.isEmpty && outData.isEmpty) {
      print("No sync available");
    } else {
      if (inData.isNotEmpty) {
        print("Check in sync available");

        inData.forEach((element) async {
          try {
            await Repository().requestCheckIn(map: element).then((value) {
              print("Check in api value ------------------- > ${value}");
              inData.remove(element);
              Get.snackbar("SYNC SUCCESS", "Successfully completed sync",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.shade500,
                  duration: Duration(seconds: 2));
            });
          } on Exception catch (e) {
            print("CHECK IN DATA SYNC FAILED DUE TO SERVER EXCEPTION----${e}");
            // Get.snackbar("Failed", "Try again",
            //     colorText: Colors.white,
            //     borderRadius: 2,
            //     snackPosition: SnackPosition.BOTTOM,
            //     backgroundColor: Colors.red.shade500,
            //     duration: Duration(seconds: 2));
          }
        });
        Pref.writeData(key: Pref.CHECK_IN_BACKUP, value: inData);
      }
      if (outData.isNotEmpty) {
        print("Check out sync available");

        outData.forEach((element) async {
          try {
            await Repository().requestCheckIn(map: element).then((value) {
              print("Check in api value ------------------- > ${value}");
              outData.remove(element);
              Get.snackbar("SYNC SUCCESS", "Successfully completed sync",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.shade500,
                  duration: Duration(seconds: 2));
            });
          } on Exception catch (e) {
            print("CHECK OUT DATA SYNC FAILED DUE TO SERVER EXCEPTION----${e}");
            // Get.snackbar("Check out data sync Failed", "Try again",
            //     colorText: Colors.white,
            //     borderRadius: 2,
            //     snackPosition: SnackPosition.BOTTOM,
            //     backgroundColor: Colors.red.shade500,
            //     duration: Duration(seconds: 2));
          }
          Pref.writeData(key: Pref.CHECK_OUT_BACKUP, value: outData);
        });
      }
    }
  }
}
