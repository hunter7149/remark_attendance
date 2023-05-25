import 'package:get/get.dart';

import '../modules/RESTRICTION/bindings/restriction_binding.dart';
import '../modules/RESTRICTION/views/restriction_view.dart';
import '../modules/approvalscreen/bindings/approvalscreen_binding.dart';
import '../modules/approvalscreen/views/approvalscreen_view.dart';
import '../modules/aprovalrequestlistscreen/bindings/aprovalrequestlistscreen_binding.dart';
import '../modules/aprovalrequestlistscreen/views/aprovalrequestlistscreen_view.dart';
import '../modules/attendancescreen/bindings/attendancescreen_binding.dart';
import '../modules/attendancescreen/views/attendancescreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leavescreen/bindings/leavescreen_binding.dart';
import '../modules/leavescreen/views/leavescreen_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';
import '../modules/management/bindings/management_binding.dart';
import '../modules/management/views/management_view.dart';
import '../modules/movementscreen/bindings/movementscreen_binding.dart';
import '../modules/movementscreen/views/movementscreen_view.dart';
import '../modules/noticescreen/bindings/noticescreen_binding.dart';
import '../modules/noticescreen/views/noticescreen_view.dart';
import '../modules/paymentscreen/bindings/paymentscreen_binding.dart';
import '../modules/paymentscreen/views/paymentscreen_view.dart';
import '../modules/personalinfo/bindings/personalinfo_binding.dart';
import '../modules/personalinfo/views/personalinfo_view.dart';
import '../modules/profileeditscreen/bindings/profileeditscreen_binding.dart';
import '../modules/profileeditscreen/views/profileeditscreen_view.dart';
import '../modules/profileviewscreen/bindings/profileviewscreen_binding.dart';
import '../modules/profileviewscreen/views/profileviewscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/taskdetailscreen/bindings/taskdetailscreen_binding.dart';
import '../modules/taskdetailscreen/views/taskdetailscreen_view.dart';
import '../modules/taskhomescreen/bindings/taskhomescreen_binding.dart';
import '../modules/taskhomescreen/views/taskhomescreen_view.dart';
import '../modules/taskscreen/bindings/taskscreen_binding.dart';
import '../modules/taskscreen/views/taskscreen_view.dart';
import '../modules/weatherscreen/bindings/weatherscreen_binding.dart';
import '../modules/weatherscreen/views/weatherscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCESCREEN,
      page: () => const AttendancescreenView(),
      binding: AttendancescreenBinding(),
    ),
    GetPage(
      name: _Paths.LEAVESCREEN,
      page: () => const LeavescreenView(),
      binding: LeavescreenBinding(),
    ),
    GetPage(
      name: _Paths.APPROVALSCREEN,
      page: () => const ApprovalscreenView(),
      binding: ApprovalscreenBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTSCREEN,
      page: () => const PaymentscreenView(),
      binding: PaymentscreenBinding(),
    ),
    GetPage(
      name: _Paths.MANAGEMENT,
      page: () => const ManagementView(),
      binding: ManagementBinding(),
    ),
    GetPage(
      name: _Paths.MOVEMENTSCREEN,
      page: () => const MovementscreenView(),
      binding: MovementscreenBinding(),
    ),
    GetPage(
      name: _Paths.TASKSCREEN,
      page: () => const TaskscreenView(),
      binding: TaskscreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEVIEWSCREEN,
      page: () => ProfileviewscreenView(),
      binding: ProfileviewscreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEEDITSCREEN,
      page: () => ProfileeditscreenView(),
      binding: ProfileeditscreenBinding(),
    ),
    GetPage(
      name: _Paths.PERSONALINFO,
      page: () => const PersonalinfoView(),
      binding: PersonalinfoBinding(),
    ),
    GetPage(
      name: _Paths.APROVALREQUESTLISTSCREEN,
      page: () => const AprovalrequestlistscreenView(),
      binding: AprovalrequestlistscreenBinding(),
    ),
    GetPage(
      name: _Paths.TASKDETAILSCREEN,
      page: () => TaskdetailscreenView(),
      binding: TaskdetailscreenBinding(),
    ),
    GetPage(
      name: _Paths.TASKHOMESCREEN,
      page: () => const TaskhomescreenView(),
      binding: TaskhomescreenBinding(),
    ),
    GetPage(
      name: _Paths.NOTICESCREEN,
      page: () => const NoticescreenView(),
      binding: NoticescreenBinding(),
    ),
    GetPage(
      name: _Paths.WEATHERSCREEN,
      page: () => const WeatherscreenView(),
      binding: WeatherscreenBinding(),
    ),
    GetPage(
      name: _Paths.RESTRICTION,
      page: () => const RestrictionView(),
      binding: RestrictionBinding(),
    ),
  ];
}
