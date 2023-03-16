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
              endPoint: AppUrl.loginApi, method: Method.POST, map: map)
          .then((value) => value);
  Future<dynamic> requestLogOut({required Map<String, dynamic> map}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.checkInOutaLT, method: Method.POST, map: map)
          .then((value) => value);
//-------------------------Attendance related api-------------------------------//
  Future<dynamic> requestCheckIn({required Map<String, dynamic> map}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.checkInOut, method: Method.POST, map: map)
          .then((value) => value);

  Future<dynamic> getPersonalAttendance({required String employeeId}) async =>
      await tokenBaseApi(
          endPoint: AppUrl.personalAttendance,
          method: Method.POST,
          map: {"employeeId": employeeId}).then((value) => value);

//------------------------------Leave related api------------------------//

  Future<dynamic> requestLeaveType({required String employeeId}) async =>
      await tokenBaseApi(
          endPoint: AppUrl.leaveType,
          method: Method.POST,
          map: {"employeeId": employeeId}).then((value) => value);
  Future<dynamic> requestLeaveHistory({required String employeeId}) async =>
      await tokenBaseApi(
          endPoint: AppUrl.personalAttendance,
          method: Method.POST,
          map: {"employeeId": employeeId}).then((value) => value);
  Future<dynamic> requestLeaveApplication(
          {required Map<String, dynamic> body}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.checkInOut, method: Method.POST, map: body)
          .then((value) => value);
  Future<dynamic> requestHitory({required Map<String, dynamic> body}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.history, method: Method.POST, map: body)
          .then((value) => value);
  Future<dynamic> requestShortLeaveApplication(
          {required Map<String, dynamic> body}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.checkInOut, method: Method.POST, map: body)
          .then((value) => value);
}
