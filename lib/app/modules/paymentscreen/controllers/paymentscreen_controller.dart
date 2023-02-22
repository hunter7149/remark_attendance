import 'package:get/get.dart';

class PaymentscreenController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  final RxMap<String, dynamic> paymentList = <String, dynamic>{
    "status": 1,
    "data": {
      "earnings": {"Basic": "100", "Medical": "300", "rent": "200"},
      "deduction": {"late": "30", "food": "50", "others": "10"},
      "total_earning": "600",
      "total_deduction": "90"
    }
  }.obs;
  late RxMap<String, dynamic> earnings;
  late RxMap<String, dynamic> deductions;

  valueSetter() {
    earnings = paymentList["data"]["earnings"];
    deductions = paymentList["data"]["deduction"];
    earnings.refresh();
    deductions.refresh();
    update();
  }

  //-------------------------Default functions--------------------------//
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
