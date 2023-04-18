import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/modules/noticescreen/controllers/noticescreen_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class COMMONWIDGET {
  String getWeatherDescription(int code) {
    switch (code) {
      case 0:
        return "Clear sky";
      case 1:
        return "Mainly clear";
      case 2:
        return "Partly cloudy";
      case 3:
        return "Overcast";
      case 45:
        return "Fog";
      case 48:
        return "Depositing rime fog";
      case 51:
        return "Drizzle: Light intensity";
      case 53:
        return "Drizzle: Moderate intensity";
      case 55:
        return "Drizzle: Dense intensity";
      case 56:
        return "Freezing drizzle: Light intensity";
      case 57:
        return "Freezing drizzle: Dense intensity";
      case 61:
        return "Rain: Slight intensity";
      case 63:
        return "Rain: Moderate intensity";
      case 65:
        return "Rain: Heavy intensity";
      case 66:
        return "Freezing rain: Light intensity";
      case 67:
        return "Freezing rain: Heavy intensity";
      case 71:
        return "Snow fall: Slight intensity";
      case 73:
        return "Snow fall: Moderate intensity";
      case 75:
        return "Snow fall: Heavy intensity";
      case 77:
        return "Snow grains";
      case 80:
        return "Rain showers: Slight intensity";
      case 81:
        return "Rain showers: Moderate intensity";
      case 82:
        return "Rain showers: Violent intensity";
      case 85:
        return "Snow showers: Slight intensity";
      case 86:
        return "Snow showers: Heavy intensity";
      case 95:
        return "Thunderstorm: Slight or moderate";
      case 96:
        return "Thunderstorm with slight hail";
      case 99:
        return "Thunderstorm with heavy hail";
      default:
        return "Unknown weather code";
    }
  }

  static loginInput({
    required String hinttext,
    required TextEditingController controller,
    required bool obsecure,
  }) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
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
          prefixIcon: Icon(
            Icons.email,
            color: AppColors.mainBlue,
          )),
    );
  }

  static generalTextBox(
      {required String hinttext,
      required TextEditingController controller,
      required bool obsecure,
      TextInputType? keyboardType,
      int? maxline,
      bool? readonly}) {
    return TextField(
      readOnly: readonly ?? false,
      controller: controller,
      obscureText: obsecure,
      maxLines: maxline ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1,
          ),
        ),
        // prefixIcon: Icon(
        //   Icons.email,
        //   color: AppColors.mainBlue,
        // )
      ),
    );
  }

  static commonTextEdit(
      {required String hinttext,
      required TextEditingController controller,
      required bool obsecure,
      TextInputType? keyboardType,
      int? maxline,
      bool? enabled,
      double? radius,
      Color? borderColor}) {
    return TextField(
      style: TextStyle(color: Colors.black, fontSize: 16),
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      obscureText: obsecure,
      enabled: enabled ?? true,
      maxLines: maxline ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(
            width: 1,
            color: borderColor ?? Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue.shade200,
          ),
        ),
      ),
    );
  }

  static button(
      {required String title,
      required VoidCallback funtion,
      double? height,
      Color? backgroudcolor,
      Color? textcolor}) {
    return ZoomTapAnimation(
      onTap: funtion,
      child: Container(
        height: height ?? 40,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: backgroudcolor ?? AppColors.mainBlue,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: textcolor ?? Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  static addtoCart(
      {required String title,
      required VoidCallback funtion,
      double? height,
      double? margin,
      Color? color}) {
    return ZoomTapAnimation(
      onTap: funtion,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin ?? 10),
        height: height ?? 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: color ?? AppColors.mainBlue,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  static Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  static globalAppBar(
      {IconData? leadingIcon,
      Color? leadingIconColor,
      Color? backIconColor,
      IconData? bacKIcon,
      required String tittle,
      required Callback backFunction,
      VoidCallback? leadingFunction}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      toolbarHeight: 50.0,
      bottomOpacity: 0.0,
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.grey.shade700),
      leadingWidth: 25,
      title: Text(tittle),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   // Image.asset("assets/images/back_arrow.jpg"),
        //   color: backIconColor ?? Colors.grey.shade700,
        //   tooltip: 'Comment Icon',
        //   onPressed: backFunction,
        // ), //IconButton
        //IconButton
      ], //<Widget>[]
      // backgroundColor: Colors.greenAccent[400],
      // elevation: 50.0,
      leading: IconButton(
        icon: Icon(leadingIcon ?? Icons.arrow_back),
        tooltip: 'Menu Icon',
        color: Colors.grey.shade700,
        onPressed: leadingFunction ??
            () {
              Get.back();
            },
      ),
    );
  }

  static saveNotification(RemoteMessage message) {
    RxList<dynamic> noticelist = <dynamic>[].obs;
    print(
        "Recieved data type: ---------------- ${GetStorage().read(Pref.NOTICE_LIST)}");
    noticelist.value = GetStorage().read(Pref.NOTICE_LIST) ?? [];

    noticelist.refresh();
    if (message.notification != null) {
      Map<String, dynamic> data = {
        "title": message.notification!.title ?? "",
        "body": message.notification!.body ?? "",
      };

      noticelist.add(data);
      noticelist.refresh();
      // GetStorage().remove(Pref.NOTICE_LIST);
      GetStorage().write(Pref.NOTICE_LIST, noticelist);
    }
    Get.put(NoticescreenController());
    Get.find<NoticescreenController>().loadNotices();
    print(noticelist);
  }
}
