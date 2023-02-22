import 'dart:io';

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
    finalMap['device_id'] = Pref.readData(key: Pref.DEVICE_IDENTITY).toString();
    finalMap['current_os'] = Platform.isAndroid ? 'android' : 'ios';

    if (Pref.readData(key: Pref.LOGIN_INFORMATION) != null)
      finalMap['user_id'] =
          Pref.readData(key: Pref.LOGIN_INFORMATION)['user_id'].toString();

    /// ---- @end
    return await ApiService().request(endPoint, method, map);
  }

  @override
  Future<dynamic> tokenBaseApi(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    ///Adding some value in recieved map
    Map<String, dynamic> finalMap = map;
    finalMap['version_code'] =
        await PackageInfo.fromPlatform().then((value) => value.buildNumber);
    finalMap['device_id'] = Pref.readData(key: Pref.DEVICE_IDENTITY).toString();
    finalMap['current_os'] = Platform.isAndroid ? 'android' : 'ios';
    // if (Pref.readData(key: Pref.LOGIN_DATA) != null)
    //   finalMap['user_id'] =
    //       Pref.readData(key: Pref.LOGIN_DATA)['user_id'].toString();

    ///-- @end
    return await ApiService(
            token: Pref.readData(key: Pref.LOGIN_INFORMATION)['token'])
        .request(endPoint, method, finalMap);
  }
}
