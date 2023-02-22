import 'package:attendance/app/api/url/app_url.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../provider/provider.dart';
import '../service/api_service.dart';
import '../service/prefrences.dart';

class Repository extends Providers {
  var deviceId = Pref.readData(key: Pref.DEVICE_IDENTITY);

  ///-------------------------User related api-------------------------///
  Future<dynamic> requestLogin({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.loginApi, method: Method.GET, map: map)
          .then((value) => value);

//-------------------------Notification related api-------------------------------//
  Future<dynamic> getAllNotification() async =>
      await tokenBaseApi(endPoint: "", method: Method.GET, map: {})
          .then((value) => value);
}
