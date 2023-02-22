import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = 'https://mocki.io/v1/';

class ApiService extends GetxService {
  late Dio _dio;
  static header({String? token}) => {
        "Content-Type": 'application/json',
        "Accept": 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

  ApiService({String? token}) {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: header(token: token)));
    initInterceptors();
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('REQUEST[${options.method}] => PATH: ${options.path} '
          '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  Future<Map<String, dynamic>> request(
      String url, Method method, Map<String, dynamic>? params) async {
    print("requested params -> $params");
    Response response;
    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }
      print("response status code -> ${response.statusCode}");
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 422) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch (e) {
      throw Exception("No Internet Connection -> $e");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e) {
      // throw Exception(e.response?.data);
      return e.response?.data;
    } catch (e) {
      print("error $e");
      throw Exception("Something Went Wrong");
    }
  }
}
