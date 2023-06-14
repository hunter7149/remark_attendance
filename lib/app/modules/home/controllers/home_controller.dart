import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:attendance/app/api/repository/repository.dart';
import 'package:attendance/app/api/service/connection_checker.dart';
import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/modules/sync/checkinoutsync.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../firebase/pushnotificationservice.dart';

class HomeController extends GetxController {
  List<Color> randomeColor = [
    AppColors.modernBlue,
    AppColors.modernGreen,
    AppColors.modernPurple,
    AppColors.modernRed,
    AppColors.modernCoolPink,
    AppColors.modernSexyRed,
    AppColors.modernChocolate,
    AppColors.modernPlantation
  ];
  RxInt randome = 0.obs;
  RxMap<String, dynamic> userInfo = <String, dynamic>{
    "userId": 123456,
    "profileImage": "web link",
    "personal": <String, dynamic>{
      "empName": "Mohammad Khalid Bin Oalid",
      "empDob": "4/9/1998",
      "empFather": "Mohammad Toriqul Islam",
      "empMother": "Mosammat Nurjahan Begum",
      "empFatherProf": "Sub Inspector of police",
      "empMotherProf": "Housewife",
      "gender": "Male",
      "bloodGroup": "O+",
      "height": "5.8'",
      "weight": 50,
      "nationality": "Bangladeshi",
      "nid": "1234567890695",
      "religion": "Islam",
      "tinNo": "1231230123123",
      "phone": "01303146132",
      "email": "emonnatbd@gmail.com",
      "maritalStatus": "married",
      "spouseName": "Labonni Akter",
      "spouseDob": "05/09/2001",
      "noOfChildren": 0,
      "children1name": "Abir",
      "children1dob": "10/1/2012",
      "children2name": "Kaniya",
      "children2dob": "3/1/1997",
      "passport": "123129834091283",
      "passportExp": "09/10/2029",
      "drivingLicense": "12031029310293",
      "drivingLicenseExp": "10/12/2028"
    },
    "address": {
      "present": {
        "division": "Dhaka",
        "district": "Dhaka",
        "policeStation": "Vatara",
        "postOffice": "Vatara",
        "postCode": 1229,
        "village": "Block G,Bashundhara RA"
      },
      "permanent": {
        "division": "Natore",
        "district": "Natore",
        "policeStation": "Natore sadar",
        "postOffice": "Natore sadar",
        "postCode": 6400,
        "village": "Mollikhati"
      }
    },
    "academic": [
      {
        "examName": "BSc.",
        "group": "CSE",
        "board": "Dhaka",
        "institute": "American International University-Bangladesh",
        "division": "Dhaka",
        "passingYear": "2021",
        "result": "3.53",
        "scale": "4.00",
        "copy": "wesitelink"
      },
      {
        "examName": "HSC",
        "group": "science",
        "board": "Rajshahi",
        "institute": "Ns Govt. College",
        "division": "Rajshahi",
        "passingYear": "2016",
        "result": "4.75",
        "scale": "5.00",
        "copy": "wesitelink"
      },
      {
        "examName": "SSC",
        "group": "science",
        "board": "Rajshahi",
        "institute": "Natore Govt. Boys' High School",
        "division": "Rajshahi",
        "passingYear": "2014",
        "result": "5.00",
        "scale": "5.00",
        "copy": "wesitelink"
      },
    ],
    "experience": [
      {
        "organization": "Pulse Tech Ltd.",
        "department": "Software",
        "jobTitle": "Mobile Application Developer",
        "startDate": "08/06/2021",
        "endDate": "31/01/2021",
        "tenure": "N/A",
        "reason": "Job switch",
        "responsibility": "Develop mobile application"
      }
    ],
    "contacts": {
      "emergency": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      },
      "reference": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      },
      "nominee": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      },
      "guarantor": {
        "name": "Laboni Akter",
        "organization": "N/A",
        "contactNo": "01723515467",
        "email": "arshi@gmail.com",
        "address": "Dhaka",
        "nid": "12312312",
        "relation": "spouse"
      }
    },
    "training": [
      {
        "name": "Microsoft office",
        "type": "Technical",
        "institute": "Bangladesh Technical Board",
        "startDate": "10/2/2013",
        "endDate": "12/9/2013",
        "duration": "6 months",
        "copy": "web link"
      }
    ],
    "healthinfo": [
      {
        "issueType": "Fever",
        "description": "High fever",
        "prescriptiom": "provided"
      }
    ],
    "languages": [
      {
        "name": "English",
        "speaking": "good",
        "reading": "good",
        "writing": "good",
        "understanding": "good",
        "remarks": "N/A"
      }
    ]
  }.obs;
  RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;
  RxBool isSignOut = false.obs;
  requestSignOut() async {
    String UserId = Pref.readData(key: Pref.USER_ID).toString();

    if (UserId == "playtester123") {
      Pref.removeData(key: Pref.USER_ID);
      Pref.removeData(key: Pref.USER_PASSWORD);
      Pref.removeData(key: Pref.LOGIN_INFORMATION);
      Get.offNamed(Routes.LOGINSCREEN);
    } else {
      if (await IEchecker.checker()) {
        try {
          isSignOut.value = true;
          update();
          await Repository().requestLogOut(map: {
            "HrCrEmp": "${UserId}",
          }).then((value) {
            if (value["result"]!
                .toString()
                .toLowerCase()
                .contains("Sucessfuly Logout.".toLowerCase())) {
              isSignOut.value = false;
              update();
              Get.snackbar("Success", "${value['result']}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM);

              Pref.removeData(key: Pref.USER_ID);
              Pref.removeData(key: Pref.USER_PASSWORD);
              Pref.removeData(key: Pref.LOGIN_INFORMATION);
              Get.offNamed(Routes.LOGINSCREEN);
            } else {
              isSignOut.value = false;
              update();
              Get.snackbar("Failed", "${value['result']}",
                  colorText: Colors.white,
                  borderRadius: 0,
                  animationDuration: Duration(seconds: 0),
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.BOTTOM);
            }
          });
        } on Exception {
          isSignOut.value = false;
          update();
          Get.snackbar("FAILED", "SERVER ERROR",
              colorText: Colors.white,
              backgroundColor: Colors.red,
              borderRadius: 0,
              animationDuration: Duration(seconds: 0),
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        isSignOut.value = false;
        update();
        Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
            colorText: Colors.white,
            borderRadius: 0,
            animationDuration: Duration(seconds: 0),
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  RxInt offlineCheckInCount = 0.obs;
  RxInt offlineCheckOutCount = 0.obs;

  offlineSyncDataCounter() {
    List<dynamic> inData = Pref.readData(key: Pref.CHECK_IN_BACKUP) ?? [];
    List<dynamic> outData = Pref.readData(key: Pref.CHECK_OUT_BACKUP) ?? [];
    offlineCheckInCount.value = inData.length;
    offlineCheckOutCount.value = outData.length;
    update();
  }

  RxBool isSyncing = false.obs;

  offlineDataSync() async {
    isSyncing.value = true;
    update();

    await CHECKINOUTSYNC().CheckInOutSync();
    isSyncing.value = false;
    update();
    offlineSyncDataCounter();
  }

  // requestSignOut() {
  //   Pref.removeData(key: Pref.USER_ID);
  //   Pref.removeData(key: Pref.USER_PASSWORD);
  //   Pref.removeData(key: Pref.LOGIN_INFORMATION);
  //   Get.offNamed(Routes.LOGINSCREEN);
  // }
  dataBinder({required dynamic data}) {
    userProfile.clear();
    userProfile.value = data ?? {};
    userProfile.refresh();
    randome.value = Random().nextInt(7);
    update();
  }

  firebaseStore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference stringsCollection = firestore.collection('fcm_token');

    DocumentReference documentRef =
        firestore.collection('latest_version').doc('latest_version');
    DocumentSnapshot<Object?> snapshot = await documentRef.get();
    dynamic tempVer = snapshot.data();
    latestVersion.value = tempVer['verson'] ?? '';
    isForce.value = tempVer['force'] ?? false;
    updateMessage.value = tempVer['message'] ?? "";
    update();
    print(snapshot.data());
    String fcmtoken = Pref.readData(key: Pref.FCM_TOKEN).toString();
    String email = Pref.readData(key: Pref.USER_ID);
    if (fcmtoken != '' && fcmtoken != 'null') {
      try {
        await stringsCollection.doc("${email}").set({
          'device': Pref.readData(key: Pref.DEVICE_IDENTITY).toString(),
          'token': fcmtoken,
          'userId': "${email}"
        });
        print('String uploaded successfully');
      } catch (e) {
        print('Error uploading string: $e');
      }
    } else {
      firebaseStore();
    }
  }

  initFirebaseNotice() async {
    Platform.isAndroid ? await FirebaseService.initialize() : () {};
    Platform.isAndroid ? await firebaseStore() : () {};
    _checkVersion();
  }

  //------------------Code for version check---------------------//
  PackageInfo? _packageInfo;
  RxString latestVersion = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isForce = false.obs;
  RxString updateMessage = ''.obs;

  Future<void> _checkVersion() async {
    isLoading.value = true;
    update();

    try {
      // Retrieve the current installed version
      final packageInfo = await PackageInfo.fromPlatform();
      _packageInfo = packageInfo;

      // Retrieve the latest version from Google Play Store
      final url = Uri.parse(
          'https://play.google.com/store/apps/details?id=com.remark.attendance');
      // if (await canLaunchUrl(url)) {
      //   await launchUrl(
      //     url,
      //   );
      // }

      // Compare the versions

      if (_packageInfo != null && latestVersion.value != '') {
        final installedVersion = _packageInfo!.version;

        final isNewVersionAvailable =
            latestVersion.value.compareTo(installedVersion) > 0;

        if (isNewVersionAvailable) {
          // Prompt the user to update
          updateAlert(
              message: updateMessage.value,
              version: latestVersion.value,
              force: isForce.value);
        }
      }
    } catch (e) {
      isLoading.value = false;
      update();
      print('Failed to check version: $e');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  //  onPressed: () async {
  //               // Open the app page in Google Play Store
  //               final storeUrl = Uri.parse(
  //                   'https://play.google.com/store/apps/details?id=com.remark.attendance');
  //               if (await canLaunchUrl(storeUrl)) {
  //                 await launchUrl(storeUrl);
  //               }
  //             },

  static updateAlert(
      {required String message, required String version, required bool force}) {
    return Get.generalDialog(
        barrierDismissible: false,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value,
                sigmaY: 4 * anim1.value,
              ),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
        pageBuilder: (ctx, anim1, anim2) => MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Update available",
                        style: TextStyle(),
                      ),
                      force
                          ? Container()
                          : InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                    child: Icon(
                                  Icons.close,
                                  color: Colors.red.shade800,
                                  size: 20,
                                )),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                    ],
                  ),
                  content: Container(
                      // height: 300,
                      width: double.maxFinite,
                      child: Text("${message}",
                          style: TextStyle(color: Colors.black))),
                  actionsPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                            child: ZoomTapAnimation(
                          onTap: () async {
                            final storeUrl = Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.remark.attendance');
                            if (await canLaunchUrl(storeUrl)) {
                              await launchUrl(storeUrl);
                            }
                          },
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.modernGreen,
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text("Update",
                                  style: TextStyle(color: Colors.white))),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    dynamic data = Get.arguments;

    offlineSyncDataCounter();
    dynamic allData = data['data'];
    print(allData);
    dataBinder(data: allData);
    await initFirebaseNotice();
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
