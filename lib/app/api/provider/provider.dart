import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../callbacks/callbacks.dart';
import '../service/api_service.dart';
import '../service/prefrences.dart';

abstract class Providers implements CallBack {
  @override
  Future<dynamic> commonApiCall(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    Map<String, dynamic> finalMap = map;
    finalMap['version_code'] =
        await PackageInfo.fromPlatform().then((value) => value.buildNumber);
    // finalMap['macAdds'] = "c295f3a8cebb9807";
    finalMap['macAdds'] = kDebugMode
        ? "c295f3a8cebb9807"
        : Pref.readData(key: Pref.DEVICE_IDENTITY).toString();
    finalMap['os'] = Platform.isAndroid ? 'android' : 'ios';

    // if (Pref.readData(key: Pref.LOGIN_INFORMATION) != null)
    //   finalMap['user_id'] =
    //       Pref.readData(key: Pref.LOGIN_INFORMATION)['user_id'].toString();

    /// ---- @end
    return await ApiService().request(endPoint, method, map);
  }

  @override
  Future<dynamic> tokenBaseApi(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    String token = Pref.readData(key: Pref.LOGIN_INFORMATION);

    ///Adding some value in recieved map
    Map<String, dynamic> finalMap = map;
    finalMap['version_code'] =
        await PackageInfo.fromPlatform().then((value) => value.buildNumber);
    // finalMap['macAdds'] = "c295f3a8cebb9807";
    finalMap['macAdds'] = kDebugMode
        ? "c295f3a8cebb9807"
        : Pref.readData(key: Pref.DEVICE_IDENTITY).toString();
    // finalMap['macAdds'] = Pref.readData(key: Pref.DEVICE_IDENTITY).toString();
    finalMap['os'] = Platform.isAndroid ? 'android' : 'ios';
    // finalMap['token'] = token;

    // if (Pref.readData(key: Pref.LOGIN_DATA) != null)
    //   finalMap['user_id'] =
    //       Pref.readData(key: Pref.LOGIN_DATA)['user_id'].toString();

    ///-- @end

    print("Requested api token ------------>${token}");
    return await ApiService(token: token).request(endPoint, method, finalMap);
  }
}
