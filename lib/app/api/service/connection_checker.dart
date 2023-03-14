import 'package:internet_connection_checker/internet_connection_checker.dart';

class IEchecker {
  static Future<bool> checker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      return true;
    } else {
      return false;
    }
  }
}
