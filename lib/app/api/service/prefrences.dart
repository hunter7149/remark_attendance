import 'package:get_storage/get_storage.dart';

class Pref {
  static final box = GetStorage();

  static var LOGIN_INFORMATION = 'login_information';
  static var USER_ID = 'user_id';
  static var DEVICE_IDENTITY = 'device-identity';
  static var FCM_TOKEN = "fcm_token";
  static var USER_PASSWORD = "user_password";
  static var CHECKED_IN = "check_in";
  static var CHECK_IN_BACKUP = "check_in_backup";
  static var CHECK_OUT_BACKUP = "check_out_backup";
  static var LATEST_LEAVE = "latest_leave";
  static var LATEST_CHECK = "latest_check";
  static var USER_PROFILE = "user_profile";
  static var NOTICE_LIST = "notice_list";

  static void writeData({required String key, required dynamic value}) =>
      box.write(key, value);

  static dynamic readData({required String key}) => box.read(key);

  static void removeData({required String key}) => box.remove(key);
}
