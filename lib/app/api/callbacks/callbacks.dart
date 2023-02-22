import '../service/api_service.dart';

abstract class CallBack {
  ///------------ [common api call] - @callback
  ///only body
  Future<dynamic> commonApiCall(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map});

  Future<dynamic> tokenBaseApi(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map});
}
