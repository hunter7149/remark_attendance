import 'package:get/get.dart';

class LeavescreenController extends GetxController {
  RxList<Map<String, dynamic>> leaveHistory = <Map<String, dynamic>>[
    {"type": "Sick", "start_date": "10-12-21", "days": "2"},
    {"type": "Sick", "start_date": "01-11-21", "days": "1"},
    {"type": "Casual", "start_date": "23-11-21", "days": "2"},
    {"type": "Casual", "start_date": "30-09-21", "days": "1"},
    {"type": "Sick", "start_date": "15-08-21", "days": "3"}
  ].obs;
  @override
  void onInit() {
    super.onInit();
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
