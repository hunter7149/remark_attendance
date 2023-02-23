import 'package:get/get.dart';

import '../modules/approvalscreen/bindings/approvalscreen_binding.dart';
import '../modules/approvalscreen/views/approvalscreen_view.dart';
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
import '../modules/paymentscreen/bindings/paymentscreen_binding.dart';
import '../modules/paymentscreen/views/paymentscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/taskscreen/bindings/taskscreen_binding.dart';
import '../modules/taskscreen/views/taskscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => const LoginscreenView(),
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
  ];
}
