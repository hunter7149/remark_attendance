import 'package:attendance/app/api/service/prefrences.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

class NoticescreenController extends GetxController {
  RxList<Map<String, dynamic>> notices = <Map<String, dynamic>>[{}].obs;

  loadNotices() {
    final dynamic data = GetStorage().read(Pref.NOTICE_LIST);
    if (data != null) {
      notices.value = List<Map<String, dynamic>>.from(data);
    }
    notices.refresh();
    update();
  }

  deleteNotice({required int index}) {
    notices.removeAt(index);
    notices.refresh();
    GetStorage().write(Pref.NOTICE_LIST, notices);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadNotices();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
