import 'package:attendance/app/modules/sync/checkinoutsync.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init('remark_attendance');
  internetChecker();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

internetChecker() {
  var subscription = Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    if (await InternetConnectionChecker().hasConnection) {
      await CHECKINOUTSYNC().CheckInOutSync();
    }
    print("${result}");

    if (result != ConnectivityResult.none) {
      print(
          "Has internet----${await InternetConnectionChecker().hasConnection}");
    } else {}
  });
}
