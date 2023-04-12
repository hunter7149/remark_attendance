import 'dart:ffi';

import 'package:attendance/app/api/service/prefrences.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FirebaseService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    var initializationSettingsAndroid =
        new AndroidInitializationSettings('launch_background');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // if (notification.title == "Hi") {
        //   Get.toNamed(Routes.NOTICESCREEN);
        // }
        COMMONWIDGET.saveNotification(message);
        noticeViewer(message: message);
        // _flutterLocalNotificationsPlugin.show(
        //     notification.hashCode,
        //     notification.title,
        //     notification.body,
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         channel.id,
        //         channel.name,
        //         channelDescription: channel.description,
        //         // color: Colors.blue,
        //         importance: Importance.max,
        //         priority: Priority.high,
        //         // TODO add a proper drawable resource to android, for now using
        //         //      one that already exists in example app.
        //         // icon: "@mipmap/ic_launcher",
        //       ),
        //     ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        if (notification.title == "Hi") {
          Get.toNamed(Routes.NOTICESCREEN);
        }
        COMMONWIDGET.saveNotification(message);
        showDialog(
            // context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body!),
                    ],
                  ),
                ),
              );
            },
            context: Get.context!);
      }
    });

    print("FCM token------------------------>> ${getToken()}");
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    COMMONWIDGET.saveNotification(message);
    print('Handling a background message ${message.messageId}');
  }

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: "This is description", // description
    importance: Importance.high,
  );

  static String token = "";

  static Future<String> getToken() async {
    token = (await _firebaseMessaging.getToken())!;

    print(token);
    Pref.writeData(key: Pref.FCM_TOKEN, value: token.toString());
    return token.toString();
  }

  static noticeViewer({required RemoteMessage message}) {
    if (message.notification?.title?.toLowerCase() == "important" ||
        message.notification?.title?.toLowerCase() == "urgent") {
      return showDialog(
        context: Get.context!,
        builder: (_) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${message.notification!.title}",
                  style: TextStyle(),
                ),
                InkWell(
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
                child: Text("${message.notification!.body}",
                    style: TextStyle(color: Colors.black))),
            actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            actions: [],
          );
        },
      );
    } else {
      return _flutterLocalNotificationsPlugin.show(
          message.notification.hashCode,
          message.notification?.title,
          message.notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // color: Colors.blue,
              importance: Importance.max,
              priority: Priority.high,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              // icon: "@mipmap/ic_launcher",
            ),
          ));
    }
  }
}
