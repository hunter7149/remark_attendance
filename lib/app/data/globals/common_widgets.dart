import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class COMMONWIDGET {
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
        IconButton(
          icon: Icon(Icons.arrow_back),
          // Image.asset("assets/images/back_arrow.jpg"),
          color: backIconColor ?? Colors.grey.shade700,
          tooltip: 'Comment Icon',
          onPressed: backFunction,
        ), //IconButton
        //IconButton
      ], //<Widget>[]
      // backgroundColor: Colors.greenAccent[400],
      // elevation: 50.0,
      leading: IconButton(
        icon: Icon(leadingIcon ?? Icons.menu),
        tooltip: 'Menu Icon',
        color: Colors.grey.shade700,
        onPressed: leadingFunction ?? () {},
      ),
    );
  }
}
