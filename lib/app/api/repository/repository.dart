import 'package:attendance/app/api/url/app_url.dart';
import 'package:dio/dio.dart';

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
  Future<dynamic> requestApplication(
          {required Map<String, dynamic> body}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.checkInOut, method: Method.POST, map: body)
          .then((value) => value);

  Future<dynamic> checkAppUpdate() async => await commonApiCall(
      endPoint: AppUrl.checkInOut,
      method: Method.POST,
      map: {}).then((value) => value);

  Future<dynamic> requestWeather(
      {required double lattitude, required double longitude}) async {
    final apiUrl =
        'https://api.open-meteo.com/v1/forecast?latitude=${lattitude}&longitude=${longitude}&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability,precipitation,visibility&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,uv_index_max,uv_index_clear_sky_max,precipitation_hours&current_weather=true&timezone=auto';

    final dio = Dio();

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch weather forecast');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather forecast: $e');
    }
  }
}
